Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5C1A2567
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913961; cv=none; b=fhQBXA6w+rY6UgquGQ6waQ1hgzfXacGxpHR0og+sxRJLOO7/TmUnf3Hh9/koAyqoil6w/xhBE/+7hfzuLr+WatGpZi1iPF99ysKw1Aemk2XoqY6DP4JddoQpo4IbEnN/99rIAjRoVNp6CzBGppiAkkfFco3s02v2shbeYxW5C3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913961; c=relaxed/simple;
	bh=T0OzFQ25NNpKEMqrsEINMLVO111cmFwxp6NCZRfeuHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9z5TZHd7etAXw6mfgqfx//nd6UTvazCEJ+hTrjEjUcED3umOxDLF/SkQhTk7qzA1xLWj+vh8duCeYmWtTtaNX+jQmlWE6jX7Zf1cPc+c2eCG0+3e/KeqeoxIS7p0i7C2rMfNotO9m4TW9uSYIRb7ZvdfM6x3ufkbxIRvtNuJcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IjRQZYGY; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IjRQZYGY"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd049b5428so14179786d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738913959; x=1739518759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9WB/z3RvHjUSgTF40v0k1EWxh3NsznaOtJc4SyxiSE=;
        b=IjRQZYGYNRubYrTnAuWLv3E/GkTIdyjgmctNMRdA1la7nujWYDB6JuszWY1aLce630
         micTymt6a/sXXZ9agONYL+C/TEOLj6fHZ5utjpOCg0SzpkrW3Kec9mhEMyG71EmIlWYg
         6742hV9Db1hpLwez0AoAMdw90kJqbCFZ7YQ4wp5VIYQve9p6KrcVQBBP8JnF4WjCo1uE
         HdCsRVZnKvAaezqYdtk0EE8B8W56B5fwKqNkz6UwmrbtcCD+z1l4ti4hAPXZ/fPPLAwH
         UpxYeeiS9PLrkFCiSFmSHPWX0NoEMyS9raiAtvwJc4nW8Y7JiUFHyIj0W8tvrFiQIg9a
         SQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738913959; x=1739518759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9WB/z3RvHjUSgTF40v0k1EWxh3NsznaOtJc4SyxiSE=;
        b=cKgjEUIAOvF2WeY6AAi1EGQOiixs6TcmDOmzV5EUfUK8wT7z7tDJRvUKBt25CMQJKd
         ZMyvoeHa8NNNRdTke2vn/uBwzFLMHE9vbNGF7WYacxoEDuAfv6e6qZEHANUUeoycCaSS
         j6vP4hRkpTk7Hr6htsvBUf16ua4ap73zWHQ15/IkXCzMwEpIymNziNajMyuzFVHQNFyk
         /Iz6c9CY5TycLTKOOf9AUcZxv4y+Tt3tCE1rAWNta/OWWRzISgLRnOGvSedZOJ2LvPdK
         7Y4gV2v8Qwppk2GCSzbPmFuzx3/nC2LjmAbLCn30W0Z+ELOkbUU/YCvP754u2PZsMHLy
         bnVw==
X-Forwarded-Encrypted: i=1; AJvYcCVXsXIZc6+AUWFrsxiQZ7np6XoSHvq/wPvKO7IDessj0wLh+Uhcoi9jf1YtspOZOU3z+98O6azsMw7j4VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNJ1PXksClBnd8oPT+ajAHBIX2eyb/mULsYPXPwak41ngZMU7
	T4YKVDt7J9jD+Wer8sCbCRsTRbm0RqCslR6Pvltka69jy0UzWi5vQcjqgH11XtU=
X-Gm-Gg: ASbGncv1bewjTlORbjfqg774YIKvePtp0/3K5x7AXiil0lKnqv5Q14hfWiAu7IQjoaS
	0qGz24A6sTHN0LHLrmExklIQHXh03D7ZpomiCFmsm40ydXwTK7i0i6Vph7NhTv3ZXWsSWoDf0iQ
	uiZ08IyeGXiMx07PfCqEIeqgEnnYsH3L/cPo+s+W8nSZxx8OASXA76Fc5l/f6c+Qoo+so/IPRK1
	JVAtuNA7JC2KmY8cZAMWTwTujQSydIMpiJC4B+W2pqE0+Kj3g/D38PAIBtV07rEdVUcRgSjQNAw
	jBbgWB1jDqMCrGLBpIwPxVOeMl+oLMCSMqBhFlpD05hQAqUzBuDJy6R4JBqQdYI2JVPUSCjGmQ=
	=
X-Google-Smtp-Source: AGHT+IHDzoBp3X6CRHsU2yZZWyH/mbekkDtWIpTmfCiTByGWrM9WWa9/4B05Q35c2BVVbDnKZGl0eg==
X-Received: by 2002:a05:6214:5188:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6e44574ffafmr22618026d6.40.1738913958833;
        Thu, 06 Feb 2025 23:39:18 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43babc865sm14064106d6.101.2025.02.06.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:39:18 -0800 (PST)
Date: Fri, 7 Feb 2025 02:39:15 -0500
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com,
	alucerop@amd.com
Subject: Re: [PATCH v5 11/16] cxl/pci: Add log message for umnapped registers
 in existing RAS handlers
Message-ID: <Z6W4o12y1wACt2a6@gourry-fedora-PF4VCD3F>
References: <20250107143852.3692571-1-terry.bowman@amd.com>
 <20250107143852.3692571-12-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143852.3692571-12-terry.bowman@amd.com>

On Tue, Jan 07, 2025 at 08:38:47AM -0600, Terry Bowman wrote:
> The CXL RAS handlers do not currently log if the RAS registers are
> unmapped. This is needed inorder to help debug CXL error handling. Update
> the CXL driver to log a warning message if the RAS register block is
> unmapped.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
