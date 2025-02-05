Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14DC202C47
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738784151; cv=none; b=MByDk/SOWvlsRsVfqAg4iE0I4moDJK8pNkiJlPI6/n9vk3U1hmXkuf4CI014XPP2Vdk8yyx/2FY+mj4p+pTXGafSw0G94kxTxO8bLIxYwPg+ZdhA1D0iSZOWZKa9hGYFdnuLaHz88iy6TUZctPVepnT3tDpCg/9jIe8DjgQOSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738784151; c=relaxed/simple;
	bh=7rmeXiOFyHpHUc2gcEBdx9CMM3a6bCCbvMpYqWexx08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN+vQY/gX5OtjEwnh2GcxYYPc7N1wgb2rj+gYNrJKs00kAf3AVZm7zfOcKHZEf/qd1t9EllrbtSr6SY2B/NTr3a6HvvTEgH4cb6if+xglbzpNoHFEiBh5287k0cu8rZmBIx98XjgfOOkRV/sgcJxF9ajZtM5nl/D2oRJrU/8oOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B57nyCL9; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B57nyCL9"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6ea711805so13832185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738784148; x=1739388948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hEv6FH3+8Q9Xxcq199dXGOrCJLqcmfKdGm0I8JED3Qw=;
        b=B57nyCL9AhXYhtMwVGvTNU96zns54sLmY88t0Y2E1nwT9B7IljwGmbHRK6n9RA4A2j
         NFiDmUQoS7jeM493Xg/pgf7fMqjiXqaHzZfFN3scwms944w6zmmvWUaQYMY32maIdIKG
         pdig2tjOjTXAmyAJ4c/RM3FmI7lkSd6dCFnPunqQULBOwNtj+4OqkboDOSMou3SJ2jUi
         JyYAQ54Ljwv6ubKXCbjKwB0xtB+OHPY8UMAfGrBxohnwr8XfBIgJsf/unt2EwblVF6lL
         19iOWjqK1omu1AJBJpdiV2qLm4rq1wqWk6PP5tg3N1Snk+S31CYZDIqN3uKV2si1mdTf
         8VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738784148; x=1739388948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEv6FH3+8Q9Xxcq199dXGOrCJLqcmfKdGm0I8JED3Qw=;
        b=WKrUttbBoWpVDrrZeA1vhLQz7ir7YccvY/FIusUmZq/GZOnt1KziijZl5U3+NB0Pll
         +EFbqqwWZJLvoCVe8hjbsVPQxG39f6Qp8sJkLxCWWErEpLzqHrnfv0Bqut7DUWnv/74g
         S0L2UHt8XxcLQtGTI0XPIdZos85nZrOYsiBQJjWrQhATwakDrt/EZyk/FNNGvzMz4xm6
         bXYUhT2qFMacOQjCDyuerzhLJ40O3Nse9IO4iM+Z2x7xqXxF10eQ3+FbgLsLDeYbgqTn
         S/bGmOT5ywFiXmsU+DmfeLmULZqeCdnTnPckDTD6gaocBeCvNgx5heymgry32aj1adVx
         t0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoPbzwSzohXlnspvLAsSrloLNFN4F4t9hQo5utwVmZNij8Buq9Vyu8ZUVP7YxLFwpT5O72fnqVJgTObbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEzS+cYw1wyeu5TYalSkWJS5j0ZsLMUVXPbQGmfCgV5Y5zLTA
	tcRC4tjtKCSsRPtbZrVn8wqI+P6TOC45j+a4d/Gy9ho2gNZO7vI2qPUuWG97rseAIxp59qA4IBj
	P
X-Gm-Gg: ASbGncuRoudmnAIm5BxJ0s/llGsw5JeK6ADbL9z4W40zxVwp+ZIZ/VgrtFEbQV+Go5Y
	xnsYt7yqpt1trVvVt8hdW8fZA7ZnKsRVp3W/lkmaIxkIvZFbOLabqVdam3XlCaWzVAwrkl1YlTH
	3NqZotwDi2iH7Zt77Grmx2hk6wv+OjRpNW9/81ksy6MBUu/tNufjD3sCq/SCVjnH1+NzbCAxXXQ
	uJ6ursChlJj97GbY059r3Q3iPXOquIHdAHs2CgeI9nSC55ErFhLjTCiqQmV7MsqJhZ1quMkTwP6
	lgd/DhQeYy//0WzaY4AG8kxHuH9vytn5sGSH094foDWtStwReTLSD5gJBBdbvYsTxCl3KD9xqA=
	=
X-Google-Smtp-Source: AGHT+IEsah4I9S4q0Ze9aL8MG/O/dUCKPZO+7vyWCLiabhjOKyO3me8+KzmnUjKFwsULcJvzrFX+tw==
X-Received: by 2002:a05:6214:4613:b0:6d4:142d:8119 with SMTP id 6a1803df08f44-6e42fcdc639mr53221046d6.42.1738784147737;
        Wed, 05 Feb 2025 11:35:47 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e42778c9dbsm20875296d6.113.2025.02.05.11.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:35:47 -0800 (PST)
Date: Wed, 5 Feb 2025 14:35:45 -0500
From: Gregory Price <gourry@gourry.net>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 4/6] acpi/ghes, cper: Recognize and cache CXL Protocol
 errors
Message-ID: <Z6O9kVCDqiKwQcYi@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-5-Smita.KoralahalliChannabasappa@amd.com>
 <Z6ESAm79OIAQaXM-@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ESAm79OIAQaXM-@agluck-desk3>

On Mon, Feb 03, 2025 at 10:59:14AM -0800, Luck, Tony wrote:
> On Thu, Jan 23, 2025 at 08:44:19AM +0000, Smita Koralahalli wrote:
> > diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> > index b72772494655..4d725d988c43 100644
> > --- a/drivers/acpi/apei/ghes.c
> > +++ b/drivers/acpi/apei/ghes.c
> > @@ -674,6 +674,56 @@ static void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
> >  	schedule_work(&entry->work);
> >  }
> >  
> > +static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> > +				   int severity)
> > +{
> > +#ifdef CONFIG_ACPI_APEI_PCIEAER
> 
> #ifdef in ".c" code is ugly. But I don't see a less ugly way to deal
> with this. Moving this elsewhere and adding an empty stub function
> for when CONFIG_ACPI_APEI_PCIEAER isn't configured doesn't make things
> any better.
>

The generally accepted ways I've seen for static funcs in .c is:

#ifdef CONFIG_ACPI_APEI_PCIEAER
static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
{
	...
}
#else
static void ghes_handle_aer(struct acpi_hest_generic_data *gdata) { }
#endif

This at least makes the function that does stuff easier to read and
gives you a spot to throw out a "Config not enabled" error if its
beneficial.

More of a style nit than anything else.


But either way,

Reviewed-by: Gregory Price <gourry@gourry.net>
