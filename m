Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64C72634;
	Thu, 15 May 2025 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334766; cv=none; b=P2dkOKQlLCqNeYl6+QMPDdY16SoPluQ0P6/WbjaUsPLK70z282qFlqMx4MVUM8mWgZVUalt4YpWp0jCGGGvvLCZg31Jc7C8VjG+oFKfiDEkcI5IAiQ1RGQ4DmV2cUTEceUMDWdMtk/+1af86UapsHfSzdCe2b26CRXdJEQ6zD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334766; c=relaxed/simple;
	bh=wEBKh/iqM3MoWszrGKUaZUx1P95AgEDtK11vNViFF2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pIk1ksLafT/l/iJiQEP9af+/GrsfBgfW1xBhDdaktWjn10cXRWyYdBC5ZPQkk0ZzyX044VSbGVzsfAvaBPDq0CH/Ds26OcZvEV8htLdfpkkgBpI8UHfQye1ubUndKhWmbOPbc0Ipq8Z8Da4GKKfj7FUgnrpnETzz251mvUQ6Xus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFXG867G; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFXG867G"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b9625735so855599f8f.2;
        Thu, 15 May 2025 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747334763; x=1747939563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qsYIS79kb0IAfBBzmAe6rfF/9g2MfG/R86iqa4lA8xk=;
        b=MFXG867Gpj8CFx55384ClaydeQ4iQ/mTia3oe/q9wB7bozltWTU+xrnp4F7rdvkRC5
         YuwB/wIfOQVst7D/dpEhmxTxGTw/k5KYLKBOYQGyrkHE+ea+MGVgA9/36gQ/xqVrKhRE
         b0p3EFqWvNcyB/rG65NsPwRrJYQrkEbbSgVn/B5dj0BKBsu229FrewXMA2lxEW54/J+E
         AiwcNpqgpcHeZFBVws7P5me7pIkUXS5UeLCzWzIXWsVQIYWYDh7JNwHfsNxxQl3qHFXt
         XthwyZ+gELNHzjIlshup4xiD8diKwy41cqG4XTbwff5fbFKFdvoAesytNp1cBL+1QO6/
         VcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747334763; x=1747939563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsYIS79kb0IAfBBzmAe6rfF/9g2MfG/R86iqa4lA8xk=;
        b=W16OLH0ZVhHwFcHHcXN6c0DxApfjZ407cqNJFRjVzdhzVDQ0SI07cJwWB9yljnlwux
         kkuIJDqJYK8gI+yck3dbGeiOVce+pNSIpiD0C/PDRYmfM1+lp1Ojqu1OZBQOZlxI/DHU
         Jcxozh+qNEyx51T+3NYQMBt4wxPDRz2XvH5d+qT7oFOEqRK19YQWqPWTlGRTruQ6jQka
         CZEVQpymXC+GK69MwN3kai2WQMjJixh1owoMORzqHxdl6U26HPZzVRv9y61I726TFl9+
         vaJEAuuAsztF2lFCTdRFzhbhtp/CQqKOwL96vhvBxg4ZA3UGhCk0T87+ZKgpaMEwuick
         IfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEg5xv/CBbYnGtHDSny9OF40aooCn1cTQL2DSJWyMKd4bTxP2K3FmBpUSdcp7noiqBxrHKz7zyTY8=@vger.kernel.org, AJvYcCX8CGIS5lKe1vKF1tzSy/mVwFergi3OulROgcTK8OaPMM9d+p3nuTwmlRqvwXZKh+JMRXeQUGZmHdGm0Qsq@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJC1N4uv2wx0JUlmJBp7pXeyvC+4l+XDTluRoatsdkPeQwdXu
	cd1A5c4GsgPhNd9BbfmUBQ5PpIU+cWXeIQjbfHThIdUQw6c+0kuzL1E4
X-Gm-Gg: ASbGncvk/Io5DsttUOXtIctOAu6Q6C7PuIJH8JqPBL4IigscM0ZNlnjcVIWS4Bg7POV
	ANnKmb0vALpG7LMLL2XbsaSmy81c9asXYBM/vyk+1EEEmjmsSlibhraX7A5rg6diglpN9dGa/uD
	hwrXOAXGOnz1IihsR+0XtG0MPr01fvgIRsWbzuI+5AQTwHNMozQ4EUamRKe+1aMWVeLrFN6B8ID
	v6XEgFChYctx/fMSnUz7dg1nIC1K0mJpsRnnvKRNZlZFKmBF10Hj/xir88t/oIbWcpSdfX+ib0V
	ElR1nfeOEC3eLHfNYy2/CxeI9CvZbFP1Ro/NgH4rEqOg0c7LT37wtUyFCdES05VBmnMrw/QO/QP
	+L72S7zTI0eYEfUSV+2dPJVyWrxD7KGcZlAhDkIjB5yFnIHJoW77WXS7zdw==
X-Google-Smtp-Source: AGHT+IEZ73/a44zEUvfuIXQsBpaRUdMKS7ku3zxxtQ80+Tvg2ilNTUj8F29EJfLr5BjiZ2ebBCAGYg==
X-Received: by 2002:adf:e0c1:0:b0:3a3:5b90:5f42 with SMTP id ffacd0b85a97d-3a35c841bdfmr754245f8f.26.1747334762616;
        Thu, 15 May 2025 11:46:02 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1c87:efae:a44a:15a7? ([2a01:4b00:b211:ad00:1c87:efae:a44a:15a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm307903f8f.55.2025.05.15.11.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 11:46:02 -0700 (PDT)
Message-ID: <6af86236-6abd-4749-9e13-d8a8559f2d1a@gmail.com>
Date: Thu, 15 May 2025 19:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
 <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
 <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/05/2025 19:21, Lorenzo Stoakes wrote:
> On Thu, May 15, 2025 at 02:09:56PM -0400, Liam R. Howlett wrote:

>>
>> I more than dislike flags2... I hate it.
> 
> Yeah, to be clear - I will NACK any series that tries to add flags2 unless
> a VERY VERY good justification is given. It's horrid. And frankly this
> feature doesn't warrant something as horrible.
> 
> But making mm->flags 64-bit on 32-bit kernels (which are in effect
> deprecated in my view) would fix this.
> 

Just for clarity, flags2 is just one of the ways.

I had suggested making this a 64bit feature only as well in the initial version.

And Lorenzos suggestion about making flags 64 bit on 32 bit machines is good for me
as well.



