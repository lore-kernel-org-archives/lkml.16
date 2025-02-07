Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466214F9F7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892323; cv=none; b=AcFGYI/VKvITuRew5dBHJX6weWIOpncoTT5Xh1NJAmtyqDZhuom4En5ZtgIMEsgN0MM9EnyytIi7ywG2MShbEaXVQ5I5t65h8o6eVRG/Dst7ZUawTOadY8mUFKOeiiQmtrlKDsAL3OTKSvay3gy1u1LEro0sd9YnZcNUCaWZwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892323; c=relaxed/simple;
	bh=gY9UBQG9ViXpcGeddZUd8H24jY3ujl47h2VTZ5EnH60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQd6Og0UDtMftvNQY1FZrZQWLT0eUQ2GLIMy7aUCiJ8R017hydlt7suZYe/slXYPKuW2KaIrr+apHpA1RhlHHFL0ZIODRsDM1WQjVQeoPwyLAsT7t+w7okIp5h4ImOcm9MHb8DFn6F01icdJiSNgrHL0KoXeEqE34Hi5z5C5+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vp8S0KzV; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vp8S0KzV"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 47CF53F85D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892316;
	bh=gY9UBQG9ViXpcGeddZUd8H24jY3ujl47h2VTZ5EnH60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vp8S0KzV913F/XGggcZES9ysxF+3QjwXsDLTCJMj6H6rfJ/uE+IVA4mNWxvwPwsyX
	 S5E03ki6tnDkz4RoQsuLtdXKWgBrTOxwhlNlFPTTWIh7VH/bAv11SW4/2P30Sd9lHr
	 ViRCG36hkD38QfRTovMhadSverHXpmr5a0ux8AqCwk+hWJ8AUF17pH5UKcTTRJ4aCV
	 HoMRyVEsvBjxRdqVh2dVd5UmqHkKGsWqhsPYPEgx6C/YSOiT2kZbai6Ix6WPHDGsmB
	 WkeT2GBLQ3xgP/uhXAqS3FxFlv15jeGy3jz2pu9QMwtsuSKsE6EQPVm/z3Bkctddsk
	 kPJv1swbN9T1g==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3f4cbbbbcso2061112a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892315; x=1739497115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY9UBQG9ViXpcGeddZUd8H24jY3ujl47h2VTZ5EnH60=;
        b=HNZ2ak/m3q2J9i5pGo23QoJVobJHqZSZp0QmKXgONNMkqAQea0dFMF2BpbWmp9gaGV
         D4Tk/fCZ6T6qccydp2hTkoYyOjBlInXC2XafxzuQRzjO75y/WON84+NjGYrBeQuJSSgz
         thLZKJXGvHz+rEXur5CXJvejRC5I3dQd53RWjTUgf4LN89mxd/VB3NLQLFIMn0ATYKAy
         1yAbuGWbBXqTnhIj04t2uVumA8EiE8jwRkzVyqegyb8Myo2vE3k9+52nUnTxTBTbHua5
         oBL+v5S+l2MliEUjTvlfAVTHYQawWIHJ9W5hpw2/fpGzyO3UigbhQxXug5xcVW9iw0O5
         A0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXE2pOO81cmIlxs5bT7nHH0a//11+bSGOE/1B5VdxBzJlN/RmetHYyX2qFMtPWJCUlUuAIpCzArZ4a7HZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+uhmI+QJw18OCu7ZsFaxIlbSs1cqoNtBooqL//2+30JDBVZi7
	YmtmjwMLgUl5/v02THZmoNOtF7clsWe+CZXKCGoyEG95az73DNlqaWpHgg2uliU9M+gXLnUwofb
	QZo52JjGC3PkQSrWjPtU37KJw3U7XcBl2gwjPe2eYPELyolsyry/Wii7kGTm0Ki2s+d0J9NrfvD
	5sjV8ulrYms1tvEYcAyacU5WTP4K46YctQ2hpCsOh9gdLA62xVCTep
X-Gm-Gg: ASbGnculDzteZQa1w94rkvSphCeEl5XfmwbSQsCJPEGZL1gee0c2IwO3xbN6dg9RIjc
	feXiRtF1E/4UeyV2Hy5xSroppoMStJ5gJDrMdktPpHfgX4ZoybfCBHV9ZcWfV
X-Received: by 2002:a05:6402:26cf:b0:5dc:7f96:6244 with SMTP id 4fb4d7f45d1cf-5de45089cddmr1426842a12.23.1738892315676;
        Thu, 06 Feb 2025 17:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEIwxXUvbAeypACKoqCkHY9+qiOo7WcXxv8y91E2dSxGdm9+lDZtZFYwE31YWSzIiGsqq1YA3Dm6T1oMmn+6c=
X-Received: by 2002:a05:6402:26cf:b0:5dc:7f96:6244 with SMTP id
 4fb4d7f45d1cf-5de45089cddmr1426831a12.23.1738892315362; Thu, 06 Feb 2025
 17:38:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205231728.2527186-1-alex.williamson@redhat.com> <20250205231728.2527186-3-alex.williamson@redhat.com>
In-Reply-To: <20250205231728.2527186-3-alex.williamson@redhat.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 6 Feb 2025 19:38:24 -0600
X-Gm-Features: AWEUYZk_st6wSeMA_Mj52i8EgOFzFSeeZ4LQVCVBHDd3uRL4CKa2f0gbE5lrulA
Message-ID: <CAHTA-uYuoNb5xFcHtEVkD8gy0LF7zkZx6aUtT+55pTMKchR=cw@mail.gmail.com>
Subject: Re: [PATCH 2/5] vfio/type1: Convert all vaddr_get_pfns() callers to
 use vfio_batch
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com, 
	clg@redhat.com
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Tested-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
