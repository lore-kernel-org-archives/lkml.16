Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAE1DE4E6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446911; cv=none; b=IK8L5IovYAGICK/cV7Rwrs70xxOKN2+pIKaaMMEIrYvpDUh0r3vJ761ClUCdmyYKuAqbuftvAlYhV/LM4tAxmHFvEGpWg33lbzsPS/j1itye7oxR5s6ap1ZBmTaXERJ/eZgRPQN2LU/lE0J5Qon1NdI1Pr8DLWuqyJc/BTOuWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446911; c=relaxed/simple;
	bh=3yB5m0NyUXUmVsetwBc7N61EfrdICLsTvEHds6YZI/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYIJ/i6j3Nb9bvkYggly+onRk60U1bzMGHT6RDaRNN+bN/4SvzSHUoDcnTgoTF47ix3uptj3h9V1xrAhiyTk8+iV/hU3aFZyVnpDj1GP5a1uU77UMyEmj1wKZLv+vQiabdu9mPDaQvam997AJpzhFTg0+YO7hvmgWAwWcCCUZMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=d2bBrZAS; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="d2bBrZAS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4775ccf3e56so18208331cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745446908; x=1746051708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5F1rkWnXVQCxgZlMjPH04KG8PhXxdy/Np8jue5oE4Y=;
        b=d2bBrZASJqJ7H9kn8HiJHxvHoKLw/JetnyIYNXsUz+Dib34GzV7HT7JHl+VZq4nFZL
         ZDmtufvaQfgI3e9nFXvZt8PPjwvWeirxzZjMvCfDiqwVDuMFPH5v53o34TYJjV56COOr
         6igf9MMidpu1vptJGU0U1MsbCo4TMi0cfQ/nlh7cyrO19zDgjVgaSn+9GlNyrcZ+Au8z
         Y7ep8+colG5hw8ka5QwPr6V89xtkmsyOAyONhjj7yCteeL5SI3E0XpeAcQKT9ARvdT+J
         YNmzlvkJofE6WG+bm3xD2EQE2IzglR/4JhIFxOm2dgca4Oh2Ndc+RDwQIDThEyFVVqv2
         gA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446908; x=1746051708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5F1rkWnXVQCxgZlMjPH04KG8PhXxdy/Np8jue5oE4Y=;
        b=XNxn9LfXJSTZIEQlKEfFWINiptSyijBxTary3e6Lmybw3ajJ3eHbYcfHKNVQJ+DY/X
         +e/wLnai6cJqnNWXoPRoGY6r8y7zqYP99Z6BSnasQGwZW45GZ4DrWOcHhMeuCzM/1n+4
         /QjWwr26pE9u+cARULSRDvVPfUTBHJM/8bq2LakAjJRD6C4XphWzd71zSH2qqWal81FI
         dsae555SFZkkR6Bcxr42ag362iH84DLnSww0sHveAiFO+K+Qy5PtlOt6X9vHbZryWlxy
         4/vWXFzaiK8QYZNjE3X4vKadjQF9Ut1nwgi8iwnuukQImUlXIKjySPqhb+cTl5lFHmss
         CBMg==
X-Forwarded-Encrypted: i=1; AJvYcCW0q4LMkhiC7y+SejRb2/0vhdE1417TIjh20GWacn+EjJw4NXcqq8WCQ6tktMLy+QtLJ5RQjm96aq/6hX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjs4RuE6B9+Vl92YXym7KT3nzmfynLJNfME9oP/KGHD6dG7hid
	CM+NJEUQtW1NdGLsh5mgUxkeSdQY77Kh/fOqLREGXP9pnmqgn4scgf0fMFwBYBs=
X-Gm-Gg: ASbGnctLCGDQHMat0ZuNxC7ghpfwEbok2UO/RgSLG9qQO+QNSImwUnoYr4IAxY0kOJe
	Pmd/14J93OLan9jtVc/R46K+KNx6wiUYgM8O10Ld8g1bsABcQeuc+Ke0qYDL1AS4ke3wVsDhLlT
	4nBVI+V1VGk5CZ8C8CDO6lGinTKwfwzaaekobY/ix66Ci8N4Y3FMk72MlIhURKUeudi/G+RjIS+
	aI7bxVdRP1LBmGV3y0mzQu+B+G6jgAcBhn9VawlGShXonA/m/PsZsnn5s0YK8lZ17dDTb8N9cke
	FxNNGDDyFFfstgXWggn/IFD6Mdnb4FUaovcnI9ab5pmQDtv6vFuR3tl/3G0P8kSpXBwm5Ne+1F5
	T/MpYyS79JO1vZJ+8xQbGbxQ=
X-Google-Smtp-Source: AGHT+IHvLKmVbePb7fXOjg/ctNGWVxPz5bpBsO6AskThbz6jfaCCslzbr34ZGd4Tr3a19V7j4alfrQ==
X-Received: by 2002:a05:622a:229d:b0:477:1126:5a33 with SMTP id d75a77b69052e-47ec2b56ba6mr604641cf.1.1745446908445;
        Wed, 23 Apr 2025 15:21:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9bd6c1cbsm1927781cf.0.2025.04.23.15.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:21:48 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:21:46 -0400
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
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com
Subject: Re: [PATCH v8 04/16] cxl/aer: AER service driver forwards CXL error
 to CXL driver
Message-ID: <aAln-k3lQnylTFvV@gourry-fedora-PF4VCD3F>
References: <20250327014717.2988633-1-terry.bowman@amd.com>
 <20250327014717.2988633-5-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327014717.2988633-5-terry.bowman@amd.com>

On Wed, Mar 26, 2025 at 08:47:05PM -0500, Terry Bowman wrote:
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 46123b70f496..d1df751cfe4b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1123,8 +1169,11 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>  
>  static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>  {
> -	cxl_rch_handle_error(dev, info);
> -	pci_aer_handle_error(dev, info);


This appears to remove that last reference to cxl_rch_handle_error,
build throws a warning saying as such.

I see in patch 5 it's removed, should probably be removed in this patch
instead.

~Gregory
