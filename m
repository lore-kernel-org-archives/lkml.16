Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27272ECD1A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440402; cv=none; b=UJ7UxpIpMK3cIXJJavHVzQKzXpEWjaf6Usuv+8xfiPZKBJ99EiESCM1WJKzAlP6R7pkYNA8ZfhDQVQre5Z5oAZsi8pcZ9XZkBxmIQ4Wip3b8/u6SRnC5+KT9MD0RWRziI9phXS7U04RUs5qYgrneoHPM/rqLEkYIeABj50x8WDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440402; c=relaxed/simple;
	bh=OMbvB3+Bgh7ZH/dGCkrpzdqRe/AVt/TYCz0eQJ4uPEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJR7OPPICt8kBLBImWTDEG5x2iUxR85YKZ1PD+umy0NF672p9Z8KK9a6EfD5hWkN20TLc6HDcb/wPchCQOeNdAxfNVi6GR9DSJ1xrZGfxN0RAaj4ASf6h7W0AQBsna/fSFkyz9Xz8ysSuob7Rx/BH7SD4vLuqj9jYDT3VKHe8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ItdQE9Nk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ItdQE9Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750440399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oW1wB1FdrUHROAIYbkZS8OO3BReKXHOvb71P4QLKK10=;
	b=ItdQE9NkjslrfxgttpYIRzaSJhl8Ol9obybyydhEfBXlPRptUSkd+GXNn34PLjy0ZbHJ6k
	jts0LQFsRKq+OrGO0YEGF6jsEZ6m+ZdMyMjSl/pJitznzkaZk9B1hCfQSLxAB0EMhMP2Tr
	WOAIrAzxAEz5VzblnWY5w/um8qQobU4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-NHP4OT9vO-CI5YZBmpv-qg-1; Fri, 20 Jun 2025 13:26:38 -0400
X-MC-Unique: NHP4OT9vO-CI5YZBmpv-qg-1
X-Mimecast-MFC-AGG-ID: NHP4OT9vO-CI5YZBmpv-qg_1750440396
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d400a4d4f2so85421885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440395; x=1751045195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW1wB1FdrUHROAIYbkZS8OO3BReKXHOvb71P4QLKK10=;
        b=MFeCcue9rla4LvNxWKJ0OnWqjsq75OEbKweNMfuTvQ7L/rY+W2UcgB9P5d7y+WyZ+y
         tU3f3xUCK3/WM8OoRTeAmpSbs2dpujWssPNg7NPeOY2+/iETT5EFUpr5IGPdosw0d652
         DcLpUy4uGtkRGZEvKTtkzliUadjJGqHByGe2ffrlnR73sjP+LwSqTGp740Exy7mvMYBl
         UsYxo9vVh4luYLXfnHcO3kyuYfuzGLNL06oWXzhYBIui6IWiTx+kwESELmi7YH+JZsBe
         x2a9dRZoBuBMPoEyHE0oV2Ulr3l8WQRaAwmJEy8Tuvg/0ywWa8kg+z9Q/e+AIUy6KfTX
         S8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVZYCWQWwmeNwZTnR1l0JhhCRUCHpBiz4ZdCTFnDeYBsOR2TtQ//emiv3iWRHDRt4qmUKMJw5DLB1L2up8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+51jk8+qYjWDv7EKQzdhrvu1DymS77dPYJa+xRp6dVttLs0A
	Q46drL2EHW8nZ8P5UBR7gQwWKCiYo9I0POof0JaJt3oRVyM34Y8ywBLPBemBe6Y472mSrV+CH2C
	hqA4b5kcRdTb6FFBtDsI0iyB3Ez4w7U+ISFqETdfMU0p5XjrtwJbfOY9OsCs0RCh2YA==
X-Gm-Gg: ASbGncto2kEWEGuTxiaKbh5L3My2/DsZZ6Q301p3NoS2N3EtLgh+fzo1x1DamvZnEjD
	vUMIhRlMm52OMlF+JzSTkru1zyxYuHiYs8oM8FcsQI0+V3KKT2LsOJaEpqbS3e7I9vduTsk4L54
	12br0zj1fkaLQTHIYtkjDHYOmT/VhI+PiAwg7UjA+itWoRo+mty1Y6xx9JguepcJONtBUP5VPsf
	JFIEf3dqIgSZfd8sZINR+cr1cFfhd7S/ibAvodxAXn5ykkOvDbHy450RZ3XGx3SlOYPGqvia7Vp
	pmwlG0uRN1L091+TXYQ=
X-Received: by 2002:a05:620a:4508:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d3f9923e6bmr440263785a.34.1750440395703;
        Fri, 20 Jun 2025 10:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwn0FOYZdQIgzW0lIgog7qT3m0aCTEHJnIBNGa4hMVm/8ZQQ5oeBJdA+DeqKv13eQnIHQcNA==
X-Received: by 2002:a05:620a:4508:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d3f9923e6bmr440257685a.34.1750440394942;
        Fri, 20 Jun 2025 10:26:34 -0700 (PDT)
Received: from thinkpad2024 ([71.217.79.154])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999c1b6sm114174185a.6.2025.06.20.10.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:26:34 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:26:32 -0400
From: "John B. Wyatt IV" <jwyatt@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>,
	Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
	John Kacur <jkacur@redhat.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] cpupower: Allow control of boost feature on non-x86
 based systems with boost support.
Message-ID: <aFWZyPs4eBwGcKPu@thinkpad2024>
References: <20250522061122.2149188-1-fj5851bi@fujitsu.com>
 <aDhJdTWzDihchywc@thinkpad2024>
 <OS9PR01MB14003E72236096AD987D2D4CED96DA@OS9PR01MB14003.jpnprd01.prod.outlook.com>
 <0053926a-7b0a-4e49-9acf-fcb1d73134cc@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0053926a-7b0a-4e49-9acf-fcb1d73134cc@linuxfoundation.org>

On Wed, Jun 18, 2025 at 03:54:56PM -0600, Shuah Khan wrote:
> On 6/3/25 01:16, Shinji Nomoto (Fujitsu) wrote:
> > John Wyatt wrote:
> > > Did you test this on non-x86 systems? If so, would you please provide details on those architectures and systems?
> > 
> > Hello,
> > 
> > This patch has been tested on Arm-based systems.
> > 
> > * It was tested on our internal simulator based on QEMU which supports boost.
> > * It was tested on the Nvidia grace system (which does not support boost).
> > * The cppc_cpufreq driver is working on both of the above systems.
> > 
> > We have also confirmed that it continues to work as expected on AMD systems.
> > 
> 
> John,
> 
> Let me know if you are good with this testing details.

I have not tested it, but I the testing details are fine.

-- 
Sincerely,
John Wyatt
Software Engineer, Core Kernel
Red Hat

