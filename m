Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58B262FDC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016908; cv=none; b=J1h5yaEDtYbsG5kQniaIOnRlzi9vWUfMMfQHBv+b1fs2gvoOGmOnUTJKVe1mDLxA5Ybl3YmZXAeoqHTqxrcpkm1yjZM9uYP0n8P4qidvcJrKpjPNGXPQnEmaqcLoOV5xnh5pH/YkXRjIUN4OecI9Q0Lsplg07wuX+bnLstjslr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016908; c=relaxed/simple;
	bh=OTfj5VgHFZ5gbh9tkYj67lK1g1D5j4ylUMJ/45wngNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/iG5fitxNCU0xgbT0glp06IzaBWpQ2Q1Ofwhrd68HwuB/FFK74RxL7efhopM9P7bl2qLuc5Q73zgWAXE2z7FtykrGj8655nt7kibQoUpv/y3/Hx47FlWoxbH7x0y9+CrktFw7OM9wVmus2iSMqSd3xzFwF6CTM+maKcwra7qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IelnpEic; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IelnpEic"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso64271485e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749016904; x=1749621704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=js3ePkAFRXu2bd4kJEDMYhddIA3XtbtOgMVgKzlYv50=;
        b=IelnpEicNQ8mjcrzJGFV7DLQVuoojkiEqIgUF+Nuxo4MTV1TYP7XtHh4LyrqVGiOvY
         XF+C3v3QofQCSlDFeW/nz5nJCcvELjORNfYfqjtkKvYZv9IWKzezJpCltKn4GV1iWnog
         rWkQkO3hAxNRzhiZV8sBr63LBFsFL87v/5TahTkzbPy63uHR788zaTJ5TOhffRV/t7Xz
         gnha9wL/aqQe68Z5GCYXBJk4w8f0++5w/geuXqX9OQhn5v6yfk5xFEhCnf/biu1tmwZd
         OU4NEaeu0cOhmwpyGpaJ6NFHX9cL98ls6tJmkSzOdepfTL4iMM5oRgXE5QXc9+yWuovq
         2XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016904; x=1749621704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js3ePkAFRXu2bd4kJEDMYhddIA3XtbtOgMVgKzlYv50=;
        b=a/rQ5UsfNTqKqbOmdFJuJ/ghS/kR2Pjt6HLWwfJh39cXRQxTynAXwJTLWxSiH26WWy
         fAWZSLsO7n0tdoO0NS28gam6jRXlID0qfPKQ39UdL/MCpqDDSl5cQ0EbqMBFwdgyYmfN
         uihYSqwKVN0XljQuXBn3fHSp4D3bssG6M4cVo+L6HohsQi8VTvUZA0Lg+OIBWsHvCZDZ
         7znfpvvUzux6nl0uR0ezleF/L7rd8JCxjWD87x4wVgU3VzGMdDVpb2j8sgN4KTc9pRJt
         CTQZkWqyDwEvZ82fOtjnCGfQIYGdky1UnbJTVPK2GZPOG81N0mda34VVeFOe0HV88RUD
         t/0A==
X-Forwarded-Encrypted: i=1; AJvYcCU3hdM4AdpH7M3SfPOLVOwwwVypXMpw5EfeikQ1y2UEAFx2NQ7BL5/xHExlIA5zepFPTqdNau0DkbNIAZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YycVbX14l7gxluCbfd5ao69bXMJFz72wBT1qtKEnbxp0Po/d
	kq5+MTz9Mm3DPt3cYLi0pN1GQ04STbTpGmp2qiTAjTHC+e7R+kpPaog1AcyLrniJCgY=
X-Gm-Gg: ASbGncv8T9b4esulqzOtXLyDCLvn//pqlGnOrrCzgRxWUlHsLD4zx0XZGczIYL5CiMl
	ySYw7q0nv3wb8JLQM2GV5fTuIKStIODVVKsVz8po1CBj6LFUyn2oprQo6YKQsxA6ucsIM++II0J
	tJAD77ZDTu/hsKbT/ddBNeJxzJ9iEPM1cahuGEEBOr2YVhlcrwwg81c6Qs4HbVjAYqT5uZd6RG4
	aKgnVuiCJpEPs/nqRWoWG6YeG29ooxV2usG6dfHsSTXxAbdv4SG+8uR9Hm/mBuexukuT7W4lhdW
	5F4bH3zFpdWRrjU3ii1FnwHWWMtNUurpNQYhLWFPqAVrXjTT6d2V2HEbMikIIyCiS6U=
X-Google-Smtp-Source: AGHT+IHggEMVfIpJ7Xv+hdE4EzIhRVMoFlT3x2R6JtIQQe6ubsLLxsK+lqCkT6TBd/hsKH6MzgQovA==
X-Received: by 2002:a05:6000:2082:b0:3a4:dfa5:325e with SMTP id ffacd0b85a97d-3a51d8ef828mr998998f8f.10.1749016904364;
        Tue, 03 Jun 2025 23:01:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe6c9d4sm20798221f8f.38.2025.06.03.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:01:43 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:01:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Terry Bowman <terry.bowman@amd.com>
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
Message-ID: <aD_hQ7sKu-s7Yxiq@stanley.mountain>
References: <20250603172239.159260-1-terry.bowman@amd.com>
 <20250603172239.159260-4-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603172239.159260-4-terry.bowman@amd.com>

On Tue, Jun 03, 2025 at 12:22:26PM -0500, Terry Bowman wrote:
> +static struct work_struct cxl_prot_err_work;
> +static DECLARE_WORK(cxl_prot_err_work, cxl_prot_err_work_fn);
> +
>  int cxl_ras_init(void)
>  {
> -	return cxl_cper_register_prot_err_work(&cxl_cper_prot_err_work);
> +	int rc;
> +
> +	rc = cxl_cper_register_prot_err_work(&cxl_cper_prot_err_work);
> +	if (rc)
> +		pr_err("Failed to register CPER AER kfifo (%x)", rc);

This shouldn't return rc;?

> +
> +	rc = cxl_register_prot_err_work(&cxl_prot_err_work);
> +	if (rc) {
> +		pr_err("Failed to register native AER kfifo (%x)", rc);
> +		return rc;
> +	}
> +
> +	return 0;
>  }

regards,
dan carpenter

