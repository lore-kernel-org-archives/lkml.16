Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187C21C9E1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858454; cv=none; b=LgBxUp05xAkqkdskz+xEX2iPChLCKOMHXcfBnxEtDX3ztC+X637WC2nliN8ctXm2IRa5QM9hdMnYP+VLqzSANFIff74U/wu1fe93A4LUYE/9uU6x7gxb1pD5LCXDux/BnqoAVFtTJNuHKGeuGe8C8TGRyRiivvzkhqLI5AhJS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858454; c=relaxed/simple;
	bh=nrsb/6slrFvGTvXm0j6jKPf8WGzk1y3PJkT9vMo0J6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBSrBykxar8D9xzkws05SVNSZElxdLqbGc+ddzYKJU6DIbKF6IlkGbQEYQpGOMo00yhvvFt9QyRXnpk7JGSnrU4G0Ipt9rKd/UruqKaxTeh/l4oFl7YceHzftEIrNmd6cFSLNwbcKaoeKJgy15NAURjhegMd+f14dRzoyA+Ly/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MXSIOQbK; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MXSIOQbK"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e425548f1eso9076946d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738858452; x=1739463252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lewjv5vC1GR7f3hvHTYC7l4Dem4ZyJ3lIDyklSVdf8=;
        b=MXSIOQbKzUhMJgC2KgT13lK30usYCjG8wmjIQI3l61TJsDYwmYVqM9u0BpBd+LfwA+
         BhsXP1hWS8FGpZ/ZU8WgQly1pvIcIFeGSl0CGB1zzBXGuhw8fbKZKurHmzVUG+bb91b/
         QZ01xuwDDP66llHu8c/Rs1Qw5ElbAOEJiQJgUntOEnAJHsvNpW99ALlLekhS81355jq7
         4uL98hNkH5dbtPvqU33ewYJaP2qgzZqRvWjKsFwxa7ZVufzP9VDN/ttSSMIh9yxT+dDw
         TW7ceMxTXyH3wKyx0gfgT1FMlEkoS28zSD/PbARL7hp+JpLeq6PeRfqJnK/CfKrjtyuM
         X9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858452; x=1739463252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lewjv5vC1GR7f3hvHTYC7l4Dem4ZyJ3lIDyklSVdf8=;
        b=HWkEPotkBxNAr4yBM0buVh0uTD1hZn/m8x6yIvIEqLT6ob2e4cmcoshOOAISez/BIN
         +gprMMuw4Ne7ScHQF3eZrFr/6w3ylNV2/UeJ5R39v8kZwLlUj2Smisre2sZQJ45eqeVS
         2VdReQ4FkqekaPqQM66SB3QgbHzqBIDp3LDheW8j6aCt98tQNbg/AVdpujSVQjL3nHd+
         sM4WuUOe0lbPw/XljpFyVsLzh+i3B5QMe2ZLp257sP9FisGJRw9fPJsRnRwvPBwtBsWV
         F/hJP8I/8JInY1C1ajzl/HxEG90tuWX07KjwTODPQyvqqzjNDMM1UUNVV9INjenn7d6c
         PfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAAcHqZYVXTVGiYz5rTw7UHcoZLTYjGus96MBKin96W5uFJYHtfTS6ArGeVAOykncTaikOyO1RthQpGQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPK5LRooHhOSLSXKr/h991VM9l4WMv/QDsYaVWdOwo2uAM8Pq
	rMPiV97PhHqscaqo+QNUygkggWcgTM97x1bbgSoQN3EAZ3XjksrFLVBtP7MZqiw=
X-Gm-Gg: ASbGncs+ouen2JlW55J6H57YnBQKbC4suhSkmyDDYb+kq2JKGFAY6WkQPQlYIFG6Pi0
	taIml7/qCbsZNvwxSBycoyWHQttxk4Qd4Nr/GixtSXO4NCl2isqzWP0sp1WpmI37daGqFfKNTe/
	3fi8Spwfhq+0zAoqudgdIXVxUEVdclqO8pDc8MucF3YEviLiYCHQXFSS3dbTquvqYVOFnvtqO9W
	RbMts5v8lXm0bMI7jCV/DMu6miNgFseAgposrrxmpKV5tB1rz1IdjtXW0GZxkmJQqG2u4MMjODV
	M4nDoF69mGaLcULwDdR31SK18+X2QIq1psQwX5k29E6XG9VNJ7Kn+q3LPJkyL1IvkUqx2sYBOQ=
	=
X-Google-Smtp-Source: AGHT+IHCPJkVR/Y9XWSDTzf6oo12O1B1UvudAIA23zaHHHxZzlraEKKuGMKsqWMkD3DIEDgloKWNDQ==
X-Received: by 2002:ad4:5ca8:0:b0:6d8:a946:eee5 with SMTP id 6a1803df08f44-6e42fbc629bmr106479266d6.23.1738858452144;
        Thu, 06 Feb 2025 08:14:12 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43babbaf3sm7039996d6.109.2025.02.06.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:14:11 -0800 (PST)
Date: Thu, 6 Feb 2025 11:14:09 -0500
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 2/6] efi/cper, cxl: Make definitions and structures
 global
Message-ID: <Z6Tf0ZvZMfqth_t1@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-3-Smita.KoralahalliChannabasappa@amd.com>
 <Z6O5JqL30lFr4S8Q@gourry-fedora-PF4VCD3F>
 <20250206105403.00007062@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105403.00007062@huawei.com>

On Thu, Feb 06, 2025 at 10:54:03AM +0000, Jonathan Cameron wrote:
> On Wed, 5 Feb 2025 14:16:54 -0500
> Gregory Price <gourry@gourry.net> wrote:
> 
> > On Thu, Jan 23, 2025 at 08:44:17AM +0000, Smita Koralahalli wrote:
> > > In preparation to add tracepoint support, move protocol error UUID
> > > definition to a common location, Also, make struct CXL RAS capability,
> > > cxl_cper_sec_prot_err and CPER validation flags global for use across
> > > different modules.
> > > 
> > > Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > > Reviewed-by: Dave Jiang <dave.jiang@intel.com>  
> > 
> > Reveiwed-by: Gregory Price <gourry@gourry.net>
> 
> Reviewed...
> 
> If Dave picks this up will need to tweak that.
> > 
> 

that egg on your face when someone has to spellcheck your tags
:facepalm:

trivia: The last upstream `Reveiwed` patch was 2017

Funny enough b4 takes the tag as-is.

~Gregory
