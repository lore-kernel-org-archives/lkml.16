Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF622080FD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596163; cv=none; b=O8WJnnDAwumRkile3dr7ADC/CGiW4Nfx+BxFCjqCC9GJ+1LvWKluEoTrCOH8FrkL68i4ZO6fHzewfokgTfP4xjEBPfY5msDgtd0u9P69+NumIq30iMhAeMrcrt2yMdM3VAg5dhKT0ArkvxBmXnNjbZDETbMLruBIBenLjBMFpyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596163; c=relaxed/simple;
	bh=s8T40ATQi5ozZFq3mLiRG0r8Wyc9sfTkDVrpD+sYS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebmn1GR+UHq04MZ77uOsuz0+HTB6nU8+Ss0CR2qGiyEAe8dWHcoW/rYokKPNL7+RfhhNSBajt6qOPAAqU5dAXcXWddYJapdGOUs2djNqmtg64EZZOzQkVn7XTCYsmg2W6p/FfS32snsLRHuMn8oao+RNd2HRtEaCp/4iHjRso0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VHyvM+0m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VHyvM+0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738596160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPyZM1t4JHDpUYVyrdVFxb2Um0jbsvrzJI4R8XaR9uA=;
	b=VHyvM+0mxz8D1ToLZ+kPH28eqf+f/XA7CMpuYVl/43+wuLo8X8mTYXxnKBYB7KIdij8eFp
	FzdcyEJsrqqYo5Vl7CWd/OkYnrpIxFr8+OwfJGNTfXtJiY/fEEG2epEGo6jOzKyHVqTWZy
	PgUzDhentl0a0H1RwQYBD0+fi8mu570=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-DI7g-pWPPyyrF7L19qssuQ-1; Mon, 03 Feb 2025 10:22:39 -0500
X-MC-Unique: DI7g-pWPPyyrF7L19qssuQ-1
X-Mimecast-MFC-AGG-ID: DI7g-pWPPyyrF7L19qssuQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385fdff9db5so1895418f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596158; x=1739200958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPyZM1t4JHDpUYVyrdVFxb2Um0jbsvrzJI4R8XaR9uA=;
        b=c+bV2RraB+98MxUeeNInBa46ZvMhlIzI5SSi5NWtPZMs+67/caN4Ko4Nk9PSO/HpcT
         lZadHprR5dSyIJD4ocf2ycRXQ63t8TvHGE+2fBGpQR0s58Jj3LktMMiPXBU5Cbuma0ou
         1nlN3XpZIGhGPNUILzm6gBwyN6a7yExQ+4EcWhktDTomaT5X6cjWTIAIiIYHQ8gupg77
         IRSFgyvNixs8xZnaQ+ElAJmxvMsi6hRZobit9jU0+3cgt/xTyiaTCkbD7WT4mixxBZrg
         6j42a81t197HjS9xkMNP8PUpiN6OEkYGW575yZo+BBdbETAnSiEdEqZ5zwaRNIX0dV12
         e99Q==
X-Forwarded-Encrypted: i=1; AJvYcCVANHzN4k6AK/TtEw8vu9Nmva8XPPydFs3JnRgUXMh1aPojfoTlnZHDvigtZjeQEmp4qEmUpFWyBv/jT9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PPHk+fJrG5CGvn8pkQYFEKIAv45cLxObLg2hEnDRFJHvtX+A
	f8bUVttb1QOQF3gl4cDL87aGUgfmhnSSB6FHBwaBZPXASZzSN6qXHGktl6YmDSJPvHdkKj5Ix2X
	S8xHgjFXLkZ2m+kXY929Btmkls8GLc2/sQqn4Rjv2Yo4DLLoYy273UZf5h161vg==
X-Gm-Gg: ASbGncvNTaA49uOuqvLJVotr/diutqHcnzINsKKJw/8yHzuZ61XroSj8EZHIggvgiqz
	LgVMfutoal8MLzLf8zOY8AtnsSxdpchfnMD7JCrWbeFC3CIzzGZygee9/rukvrHZe4YZMpxMzrS
	0hZ0k8qOo0qBKZ60MwFX/u2/aW7PNteRdj7t/AqP2MduItth0/PntxjhcNE/lfGZ2s7J4US2Nf2
	4J/qXo1GVfb+UpPJi1cay5JkrYHyeLFJ3A/t7IlgW2nAQnAWzZcmvPQkqu8izDDG0Iv/W5RzSB9
	AFKNBZTt7+AyehQ3O0c2CFlXGzxztp2ZiH8updKuz40bLxxnqRux
X-Received: by 2002:a05:6000:4011:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-38c52095e20mr20768480f8f.40.1738596158375;
        Mon, 03 Feb 2025 07:22:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU8GdTGi8sB7oRmFhV909MaP4kFCPPAe8WiAnv6V5VuMzr3T7UiP99xHMB2JJSil2uW9p+BA==
X-Received: by 2002:a05:6000:4011:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-38c52095e20mr20768432f8f.40.1738596157876;
        Mon, 03 Feb 2025 07:22:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm157161035e9.13.2025.02.03.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:22:37 -0800 (PST)
Date: Mon, 3 Feb 2025 16:22:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Markus Armbruster" <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/14] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250203162236.7d5872ff@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250203110934.000038d8@huawei.com>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<20250203110934.000038d8@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Feb 2025 11:09:34 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Fri, 31 Jan 2025 18:42:41 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Now that the ghes preparation patches were merged, let's add support
> > for error injection.
> > 
> > On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> > table and hardware_error firmware file, together with its migration code. Migration tested
> > with both latest QEMU released kernel and upstream, on both directions.
> > 
> > The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
> >    to inject ARM Processor Error records.
> > 
> > If I'm counting well, this is the 19th submission of my error inject patches.  
> 
> Looks good to me. All remaining trivial things are in the category
> of things to consider only if you are doing another spin.  The code
> ends up how I'd like it at the end of the series anyway, just
> a question of the precise path to that state!

if you look at series as a whole it's more or less fine (I guess you
and me got used to it)

however if you take it patch by patch (as if you've never seen it)
ordering is messed up (the same would apply to everyone after a while
when it's forgotten)

So I'd strongly suggest to restructure the series (especially 2-6/14).
re sum up my comments wrt ordering:

0  add testcase for HEST table with current HEST as expected blob
   (currently missing), so that we can be sure that we haven't messed
   existing tables during refactoring.
1. Introduce use_hest_addr (disabled) for now so we could place all
   legacy code to !use_hest_addr branch
2. then patches that do the part of switching to HEST addr lookup,
    * ged lookup (preferably at the place it should end up eventually)
    * legacy bios_linker/fwcfg fencing patches
    * on top of that new hest bios_linker/fwcfg ones
    * and then the rest 
    (everything that belongs to the 2nd error source should _not_ be a part of that)
3. add 2nd error source incl. necessary tests procedures introduce
   and update DSDT/HEST



> 
> Jonathan
> 

