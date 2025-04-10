Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD625D8E2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277664; cv=none; b=ZxMV43IUjVgW9jKEcT64li3b5nrWIRqub16TaOMslR6hLu6+7T5ruhhkp0tCFVQFVMWYw6cdjRni++swwHS+fxWq4Qz8VTuiauovEw46a4Krak42NGQ6fn1tBFYvxQZB5pGjnwpT0tjI646uwlt4RH5Ew/pvR96PIA6bLFjiP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277664; c=relaxed/simple;
	bh=yPhdlISTOreQ/aDX3Tsax/TWfw54sQsh5jwQ3cEiy/8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH+jmLGroA5gnmMoAusbvRA5410BUJm6XUQlEdMlcS3M7xzBAwxBduCCCKnXQ+9BG4+YUMfKo2ldeoo4A11ufNV8TJWD82y2OwOzhx4v8wt58O94GgvpqnpFbWAz+/y+aFPIjIBH5QjITkmmx1Wr91PNNKJQLnxBaW3Dg6ECLzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKABTUq3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKABTUq3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so4828081fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744277661; x=1744882461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnbKxA6lsZP3NTEmyhRFBly3B+ZmNr9pag5vwciMRm8=;
        b=SKABTUq3TPPiyyUYfZx1QoCOKKRRUd139U3fIRUVGCppWYwKtdfUEeabV9JEnNNvfi
         R/mVEVJnO5yd4JdmiBLIl08cGd7qtJL/B8xgnp0mxqA25p2ddjBZE+SSR/mQWu+Xdcpi
         zL/fu3z2WkoX3JOqKKQQW1RYUGh5iVuLTtnfsEL0i5Gw/32Ykp0jk4C3HUwNSEjpqx59
         mOXG3hJXGl1L96CiINNnhkfR0N4NXTEDopSyl6JZFThWcgKQrOfJ3OCmammgffArvGl+
         C5UZtuCK/hKyvY7GFXdYIW/HWWf5Unxl9oQgqXHuBiYW1pZebAMnAlY8+itKPZ8STePJ
         pIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277661; x=1744882461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnbKxA6lsZP3NTEmyhRFBly3B+ZmNr9pag5vwciMRm8=;
        b=LKTs0yZ47nqvF+fAcp/IGNZueAAgpW05HAQrzCET/JqMP8CDVNTJRewTluRlJ5Msd8
         xc7xXW7lM1kXLTeiRX6r2wHHISZebADRLnS4vLBuD/E79NkQTQKdGEEH5VxwT8JM2dke
         5PmeoVthy9ZAYOfInStLmYWC6vLZuvYDElA2WpiVWlqtThay16lFOTDuskiuypF1UT6A
         vHcwHySoBQqbouViAXgRAbvxGGsEjWCQmMYauComhaYmSJOJXZtdvKQJ2n44+vEDiMGp
         4RzUr8MAtHgK89wS61xamQ0vGoc9u/shWtT0af/xQTzdic85nt0fAUK57RQHvXCMHXB8
         4QFA==
X-Forwarded-Encrypted: i=1; AJvYcCWeU7bi/TrJBtSefqNv8lmNmR3xBNpW4rpXE7oWeR0IGrxFzjq+loMu2IEmQAjb1IcH7Yafl2YRdZ+MJ10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFdO+dk8CiuF4WFq6UROVi4150n6Mq2jKD8Yy1b4KMfgs4Pwj
	cIgqHLIrd4MQBFaLqyd+myX0uESytFicOuOK5nBvfTv70kgkQUfc
X-Gm-Gg: ASbGncuUZzQwQMrJyqGImCuaqW53k3wyontpiTIvLHUib8ThNmlClxg++UdGFyV7dTH
	Ij4EFtUaqzynZvHzcK4Xu4kknMUbQOb/eR+92eWnASxnx4gA01cTAk0UicCKoEMAGvBjpNHgvsF
	ZqoamQzV186ITb335EX7+2ttquLlk3pBPmGd8AycI5ffZ/XLZb5q9eHylaOldGYQFkcaRnVeji9
	fRgWpGiiGtZAPOhedCTOxsGUPsaWl5hufQhOFnLPcOiXMDZQesw8wK7F8TKiuEYJadYwIh2XGfA
	AWqE+MxLGxUYV+rsgsv7E3nStQo/C/KPgd4rwB/2MZAGPwpqd+vxoI2AeoHlEmAw8KaWZ7k=
X-Google-Smtp-Source: AGHT+IGncMzME+9f61iMxAYOrzMSnbuBplArYyFnuUwO4WDMRKBFiYikSvdFy7p+n78+o5CKz5ZdzA==
X-Received: by 2002:a2e:be2a:0:b0:30c:177c:9e64 with SMTP id 38308e7fff4ca-30faccbcc09mr7438541fa.35.1744277660721;
        Thu, 10 Apr 2025 02:34:20 -0700 (PDT)
Received: from pc636 (host-90-233-203-182.mobileonline.telia.com. [90.233.203.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d509bsm3982621fa.84.2025.04.10.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:34:20 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 10 Apr 2025 11:34:18 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
Message-ID: <Z_eQmixxWJk-Ryi3@pc636>
References: <20250408151549.77937-2-urezki@gmail.com>
 <202504100130.OjlBJLkQ-lkp@intel.com>
 <20250409173217.ff56242a21b4edfe9ed87e57@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409173217.ff56242a21b4edfe9ed87e57@linux-foundation.org>

On Wed, Apr 09, 2025 at 05:32:17PM -0700, Andrew Morton wrote:
> On Thu, 10 Apr 2025 01:39:24 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504100130.OjlBJLkQ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    mm/vmalloc.c: In function 'vmap_init_nodes':
> > >> mm/vmalloc.c:5087:9: warning: unused variable 'n' [-Wunused-variable]
> >      int i, n;
> >             ^
> 
> Thanks, I added
> 
> --- a/mm/vmalloc.c~vmalloc-switch-to-for_each_vmap_node-helper-fix
> +++ a/mm/vmalloc.c
> @@ -5084,7 +5084,7 @@ static void __init vmap_init_free_space(
>  static void vmap_init_nodes(void)
>  {
>  	struct vmap_node *vn;
> -	int i, n;
> +	int i;
>  
>  #if BITS_PER_LONG == 64
>  	/*
> @@ -5101,7 +5101,7 @@ static void vmap_init_nodes(void)
>  	 * set of cores. Therefore a per-domain purging is supposed to
>  	 * be added as well as a per-domain balancing.
>  	 */
> -	n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
> +	int n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
>  
>  	if (n > 1) {
>  		vn = kmalloc_array(n, sizeof(*vn), GFP_NOWAIT | __GFP_NOWARN);
> _
> 
I was about to send a fix for build warning. Thank you Andrew for sorting this out :)

--
Uladzislau Rezki
