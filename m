Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E477822B8B6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757367; cv=none; b=fhTIrnAxL72ksInZcA11/+fB2rUSFPhjr3y6g+fEJHV8eUjliojGT8eURwP6ieXUHq9k6+Mm473ncbkTv9msl4tC6Q9fXnEayQFDgP1sRB4kuOSMkK267LAcMzq+O1zOe2Q/k/qBzwtLA7Q7iWSHg7EElmWKjZ7ZSLKWc1cqPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757367; c=relaxed/simple;
	bh=LDhM1BQbzgJZCOl2D+iOUX/VC2C3LFvRV3VuZiTJ94w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VScKtu2tRqBGuEx4an99N/3IOcjF6ITzSS5D72ugnSyUT/ImbN+he/WlpU/IQSucFC2YUwEdUidvFADJvzM3CQ4TMZ5scw4CXQnUfN4ZmPg1GZSCdwo/F61MZbDsA5dQ309kQ9Alcv51F7K7Oya0nc5CZ9ETCEMo5zLd3dvmZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXGeTlvF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXGeTlvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738757364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oqorq3VqEu/wsOnV6J86n8Ow1XVNycma2QB/zT3uRJw=;
	b=WXGeTlvFkwM/BHLqWOOP/bxSDLIFd2nuqqBt7T/ErluixNVZ8AitsAq3KHU58balOAPk/S
	cvSDXVTorr2oYtL/bfj93hvWf6L94wq27O91mYqxJOzgQ6DStC7/+oSk+JQ+BoyfzjbVxu
	V0KoIEmxXEaK3E0/BZ6HBfUP7JaNQq4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-Tv9KGLTgPru06FkUjfxQWw-1; Wed, 05 Feb 2025 07:09:23 -0500
X-MC-Unique: Tv9KGLTgPru06FkUjfxQWw-1
X-Mimecast-MFC-AGG-ID: Tv9KGLTgPru06FkUjfxQWw
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e7f07332so1104879885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738757363; x=1739362163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqorq3VqEu/wsOnV6J86n8Ow1XVNycma2QB/zT3uRJw=;
        b=n2iULjjkjpIArMOT5CD0KLIAcR01tLzqnYrlAaa3lMvThFJe6h/szQHRvCtQA/A96/
         zfhxP3p9P+NQZ/F1D+K2fc1WlGTiw4dBW/xOIshqFbfSM5L8tlpAHYy5cqvYzDzZNxkr
         tQu82aq7Yg/oD8Iz5GNy8tdPIq5FdO3aPgHe0YgRc6tzMWbAE78OCcQLEwpvIs3BvKiq
         c/8GpifJFFJdhscA4x+AYGVRbELhcHdnVCBGP7RBY/yKtynDH+WLkW8FbSspQlVAad7q
         nw3RsvChtjLrN+bUdx0qIGyn+g1+pxd1JKqTwxDo6KrjLdZ6/uItvfDnflvtKBg8uEIM
         Oaqg==
X-Forwarded-Encrypted: i=1; AJvYcCWUfuSrkz4hiUaKBLHSH91gxLsc17fpk/bpn7pBLO77WSHk4+8Ltf/sqOqW2eHaKXekHfdvkjs5c31fSzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1VNdqbqKo8SlV8tVEU/DAhl0y8naRe0/c8r0sy2vvexUWnX9
	e7YVJhgjoBdmI/V/Kqt+aGCfSu2WCN674YXVISIYdYU0CaMwEk8pIUPKFtzLSVqqoWktnHhRCmL
	qtSA88l1eMdS1XlLF/j3bQJ3hcTlaTmXks/MU5NhqOAe1zBhGsImbANP8t9Icng==
X-Gm-Gg: ASbGnctn8G9+iaaoEPggBSX+vTnxEkiXM3/+rS+nrdXjTaebncOBaBw8BKaFUgRGrxJ
	WZ785QyzDB9znXct3c6NvEE804PctZ3QZG30PQk0ZUY38ToKzFkoidLWXshhUOEdIbQSlpxTQQz
	LloesHvZA+m5Cd0fDGOwKLpCRL/beos01CZQvWLh1RcyXV659RK7uUXzb4+veYmAgNps6ZszvkO
	MC5DV6K1IL/uQRlM5z6D5bla8xzctP/XsXjiTP868rZpglxkx+ANY6DIU42vQXlqYIajK4gjASb
	J/On
X-Received: by 2002:a05:620a:8905:b0:7b6:e9db:3b21 with SMTP id af79cd13be357-7c039fd4a7amr350587385a.14.1738757363186;
        Wed, 05 Feb 2025 04:09:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8PXyJhl1DaAL6BKHNBlLuayS4yGl4Jjz2cYcxmO+tPT+BXqNI9LVpnE08fvB9D/gtSMRQcQ==
X-Received: by 2002:a05:620a:8905:b0:7b6:e9db:3b21 with SMTP id af79cd13be357-7c039fd4a7amr350585285a.14.1738757362905;
        Wed, 05 Feb 2025 04:09:22 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90ce2esm742414585a.103.2025.02.05.04.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 04:09:22 -0800 (PST)
Message-ID: <e2eabe42-45b8-4930-af55-857f6e8a4317@redhat.com>
Date: Wed, 5 Feb 2025 07:09:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] intel_idle: introduce 'use_acpi_cst' module parameter
To: "Rafael J. Wysocki" <rafael@kernel.org>, dedekind1@gmail.com
Cc: linux-pm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Len Brown <lenb@kernel.org>, Prarit Bhargava <prarit@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <e9188365425d2a4c0dfa7cfa2b17ad3d9fcf2735.camel@gmail.com>
 <afbe2137-398b-4053-93e7-2a03aeb32220@redhat.com>
 <CAJZ5v0hp8f3Xjb7bkDR_+RYfTE1ck=qop_QMZ3+z4w7T0VS66g@mail.gmail.com>
 <c3f03a5837e191c5371593ac0a0e3c56e4204567.camel@gmail.com>
 <CAJZ5v0gKsqrruwSBQLk_1cC8MMRyznzE-FbsqDyzs7xFMgZoQQ@mail.gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <CAJZ5v0gKsqrruwSBQLk_1cC8MMRyznzE-FbsqDyzs7xFMgZoQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/4/25 12:33 PM, Rafael J. Wysocki wrote:
> On Tue, Feb 4, 2025 at 5:30 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>
>> On Tue, 2025-02-04 at 16:21 +0100, Rafael J. Wysocki wrote:
>>> But it could be something like "prefer_acpi" as far as I'm concerned.
>>
>> When I see "prefer_acpi", my intuition tells that it is just a preference:
>> "prefer ACPI, but may be native too". But I understood that the patch is about
>> "only ACPI and never native".
>>
>> The reasons I suggested "no_native":
>> * Sort of consistent with "no_acpi"
>> * Suggests that native won't work.
> 
> "no_native" would be fine by me too.
> 

I will send out a v2 using 'no_native' for the new parameter.

-DA

