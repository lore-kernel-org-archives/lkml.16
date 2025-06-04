Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED561F8755
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057873; cv=none; b=vDVBrglnf9+VxiMbvmZ/vaXNAMtyvQ9lhKFP7J7wkT3b/7K8CihrNugrgBOK0Czz3Azw7EEPVz8ghZXnG+Iw+b4BX9RUmq8b7jLHV1DC6NV38JdKpaRQFhKO7zFcjW4DFsHvqdng0tm71qqZ4NssSTqD05DSdVbblH+8ePrNIjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057873; c=relaxed/simple;
	bh=YI5mFLWc53VgL5FQ8bsi7skJV4Aik/gLWAIifjuXyD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVmdhe69jnXBh26cAZQulyXDfmsByFrsyCfJupsmNGofCPIWqUha0SOj2yBngBWNHibdXJ5kig865xDdfV+QPcbal0yeZ8uvrOqTmikF9ldboWq+NilIbRifZFxAqLpEveQzCC694LGo/MeuOcPePpMAZAPwmtsaA4s5tl0vQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMzyjRze; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMzyjRze"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso13147066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749057870; x=1749662670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Rx6gG3qsE4+StDVhI8Ouf35YkFJYK0JatY+uS2ZTLI=;
        b=AMzyjRze6N+CdUwAkkXRMLQyhnHh9VDOOuZs+j+q4uiq3s6KdS9GFEJq21qhfvtPbT
         fIWXNFaXLOTxIwjTCNkfIvXcpEosYQQPg5iJzgep+ehIulc0V+bVRYGCnkBxwHkMDqqB
         bqwXc7EHXMYSqAccUPKt6OAqNcatvCVEbAxbEjlEajeTA+LU1c29uD9TusSxu+t7bPkY
         R9iG7DILGEi3VM/KXvE1u565yUR7oWFZXWikYkBf0VF9Vd2sh16GqmUi0UcvdC7N1wQ0
         5kGY9jSP8ABtAdXSTZbucGAFCNzT4cj92axqg3sGplWAFRYqluAkGP7o3TQ+dDlxmpFP
         x60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057870; x=1749662670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Rx6gG3qsE4+StDVhI8Ouf35YkFJYK0JatY+uS2ZTLI=;
        b=TavfOnKvFvO52U/mdxzs3x1glrUeG9DGVvDw3hpk1EMiknWJwy8Aagu6CxyMCqDkZx
         VB6etvFWXhcN8Se9mf/x2RJ9icL/cvjjAfpEcYoOdg8DQr3gq/GA1obC6n5CKfxJo+gu
         t8pVjt7r9zeHBcyQnbcxBf9LqQECFC3ag3k0W4emq46Xu1jRaTDiNyT2wqVvYkZBeLK/
         iKN5UEEuBe2YXdXU4khDKvjn/0v2u3F3iCBCCQCKvByxMpMcg5iBS4f8J4yXcTDIxrUl
         c8DjjyObNq/pie8bYlopfouImCoYmGziogoqGyWu/oCBN0UK769erI4EaW3JyMfu9i4e
         0MOw==
X-Forwarded-Encrypted: i=1; AJvYcCWMh/rTkFUzfydA9lrDylU7e4t/kMU2CYBAPYSgvtNfUQzk0RkxZ90tBpAVw/ykPS2euZiYT5S45ft653I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/EMZce9UsGDeNtWng5s552uPLtbWZyM5P5ThQuSphFjeq8e5b
	xip960+xmnmjkzQpiRsKDT4ykIY28IteZJPvwsCnQsivw7OwNWZEh0n90y7HeGEMvxk=
X-Gm-Gg: ASbGncvipUYRhM9XDN8ggN/SEZuD1PhjhyqqwgUaKnG3LmFvK/G4e56Qo/L8VzPicWq
	qWUZ+OQbf/aUyGhduaB6z1YxSA53WT6T+M95jfr36aWteLI00WV478rSdVhUpTP7dAqT6g1ZJhV
	M2IP6b6Eauc+f/ipB4/Wea5ABco/ADC0aD/rhYfXj+AfLK4xZ2mY7Bln1r7WqdOZ70KZ4YwQ5ar
	h+2d3F00tTicnA064nCMU6VApaX/QFcpCEPJavwctv1K2OY4xDtvdstgfGZRmK/qMBcaCl/RoP1
	RzoUQ7d8ptHhKdzD4/enKRPDLz6fYPAY97nwQlASjBhNhmH07oQCXtg=
X-Google-Smtp-Source: AGHT+IH+P0WeybYhDtQX0mOthiBD4sJUH0iS4YBwLkOkmeksTa502is8e50CYha9Oj5de4xARn23DA==
X-Received: by 2002:a17:907:3e11:b0:ad8:89f8:3f66 with SMTP id a640c23a62f3a-addf8cd2118mr358479966b.21.1749057869894;
        Wed, 04 Jun 2025 10:24:29 -0700 (PDT)
Received: from localhost ([41.210.155.222])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada5d7fef72sm1127136966b.34.2025.06.04.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:24:29 -0700 (PDT)
Date: Wed, 4 Jun 2025 20:24:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Bowman, Terry" <terry.bowman@amd.com>
Cc: PradeepVineshReddy.Kodamati@amd.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, bhelgaas@google.com,
	bp@alien8.de, ming.li@zohomail.com, shiju.jose@huawei.com,
	Smita.KoralahalliChannabasappa@amd.com, kobayashi.da-06@fujitsu.com,
	yanfei.xu@intel.com, rrichter@amd.com, peterz@infradead.org,
	colyli@suse.de, uaisheng.ye@intel.com,
	fabio.m.de.francesco@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	yazen.ghannam@amd.com, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 03/16] CXL/AER: Introduce kfifo for forwarding CXL
 errors
Message-ID: <aECBR79lhlj7SPUV@stanley.mountain>
References: <20250603172239.159260-1-terry.bowman@amd.com>
 <20250603172239.159260-4-terry.bowman@amd.com>
 <aD_hQ7sKu-s7Yxiq@stanley.mountain>
 <1f719cfd-2c2b-4431-a370-290a865b0bf2@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f719cfd-2c2b-4431-a370-290a865b0bf2@amd.com>

On Wed, Jun 04, 2025 at 09:37:02AM -0500, Bowman, Terry wrote:
> 
> 
> On 6/4/2025 1:01 AM, Dan Carpenter wrote:
> > On Tue, Jun 03, 2025 at 12:22:26PM -0500, Terry Bowman wrote:
> >> +static struct work_struct cxl_prot_err_work;
> >> +static DECLARE_WORK(cxl_prot_err_work, cxl_prot_err_work_fn);
> >> +
> >>  int cxl_ras_init(void)
> >>  {
> >> -	return cxl_cper_register_prot_err_work(&cxl_cper_prot_err_work);
> >> +	int rc;
> >> +
> >> +	rc = cxl_cper_register_prot_err_work(&cxl_cper_prot_err_work);
> >> +	if (rc)
> >> +		pr_err("Failed to register CPER AER kfifo (%x)", rc);
> > This shouldn't return rc;?
> 
> This was implemented to allow for native CXL handling initialization even if
> FW-first (CPER) initialization fails. This can be changed to return rc.

No no.  I'm fine with it either way so long as it's deliberate.  But
maybe add a comment if we can continue.

	rc = cxl_cper_register_prot_err_work(&cxl_cper_prot_err_work);
	if (rc) {
		pr_err("Failed to register CPER AER kfifo (%x)", rc);
		/* Continuing regardless.  Thanks. */
	}

	rc = cxl_register_prot_err_work(&cxl_prot_err_work);

regards,
dan carpenter

