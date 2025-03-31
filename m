Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACEC189528
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445661; cv=none; b=AUPbIRVL1BhbwCop9an1kcvOyh1lgaUkmz8/QUZON2bK8TN1Qmezo2ccd+LvxHgB/DTSCcKAU6IHPepqoj7Y2Ojcwo6L39f9vM6jvXJsVr+LFT9AbWbWgHEAfeS09dKyaoZoP+FZhsnrJKz5ymPakTMNY8/Ks34SJu+LduxQR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445661; c=relaxed/simple;
	bh=zRT/zRjU6jVJSZn+qcLAB6z0VYtkrXkjOuI/iNaf2A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA0gcO8lgvz4c8lRRWeQ2cWtP+Cgl87x6acnpHygpa31uN+e3f2NStSPsVrOxgCFbr+uR1209+R2l5CIQvLy1FZL8GmtYgQpRca4flVcqZCXb/delfg4eIpRsZhP07BBNSYIOteTJFa9WwkI+uQu3SYxwHNMgBNcMRRKlUnc/Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Hr0CFKmc; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Hr0CFKmc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769b16d4fbso26612371cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743445659; x=1744050459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZeAYSY+ZaMayGoTv0WvIa7xoyxPKFeQjfsqEI/he9A=;
        b=Hr0CFKmc6aTXjFYmGIb/Ic/JbwC0VwzTBlpdrqyn/G+cMvxK+rlx/BLAMUG4u6Er96
         Drgt7gJYhMRdERelbsFOalfAyiXpaWyO0gyruA8K7LW3/W/LhP5Q+am0YuSmcD1gn5WY
         4NAnHwdF+eP5uRPpOfU1sAK6gr/14WtzTKueReecbwVsu6DFwqurfqP7sKfPegseIx1q
         yi/zENZ3mXXrCjjbiZsJwibhMCC3tzTnjA1gzDgWIOsT3czqwb19RR6Mfj6WVnEBMf2g
         9GaDV9f6loxLqCWQmVzF3EynWc6nQtcQnGttC7YsRJeYMIPIDBx3IDSGKQ8oK/3HE8ZK
         EEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445659; x=1744050459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZeAYSY+ZaMayGoTv0WvIa7xoyxPKFeQjfsqEI/he9A=;
        b=ZqwDo1ekoGWpuyoZQwAs6hrrth0mx4AkakbnwgbTdXu5PCav865y6KKb0Js8EFxLjS
         hQYxhRPvzV+wqn/0E6VVqjoZZRyxecypNnbWaqaCJZaEmJkAqgWZJyNC5cti09UL77TH
         LQsP4Ujgk5EY8GiRtDSBYosHLlZ0md4Cardf9zH/Ed1cX9eNl3psbabTpFJpxevE1Y+M
         7rm8po1e9km1//0Q0JMvZfwKpv2aPHw4JiB6sWxE+0aTDndCLduPwPc7uKBU1sdM9kCE
         J1eNS88T6ctUHEQmuu+Pi2NlRhx5XU5TrT+YMaLDm8/JsCTsZX/q2agzNcM4F4R/Mdj4
         OVaA==
X-Forwarded-Encrypted: i=1; AJvYcCVUqxJKJSPmGiifuVd2djrWhNgsqPzNETuT+KkjPKV4dK/Vu6N3fUo+6kKraO/FR64IlL5BwQAg8002+H0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlkut0Lo3UQ72UWBJ4I1ZaxCIecCHyRNjLP/95cwIBjplvxlR3
	xd25E20Mg10r2vSEWuhbIjLqmjZN0MokfgBrS5Oe+A1FjfhVp9KPZatYE9VyTzs=
X-Gm-Gg: ASbGncueQEKVqgBz01ZCWHEsInJxxsTa0VPlaGUo8sqJOdqV0rhA44fCNcitVxQd3t3
	r0ZB/rh3kUdsiXYfT2HX7I7V15J8Rqb4Ur0ax1w8xR4mkpyircGd6xPv6V14DeNfUZS3hyfsCcT
	W05om92Sa66yi/IwWA0uguh06kSP5OjCuTjWiYX8h0AumpOSra1Y6qFFRfVYTQmDzgZrlIWG8YG
	tHcXO4Vgd1howp5UmcgxhIYVkTBMtlfp5+6CEIvTsc5X/zTeEj/k/W3E92yC6j9QHOxI7c3FngA
	bZdR9JHteQ2cB5A59P2dRVg0YO/gz4QyFUlGdFzNSE88jFFTZHr1iIf+Knv8bGLLr28g9FZzUNT
	/P8fuOcDFD8u3xbVfNUm3nR46uP0=
X-Google-Smtp-Source: AGHT+IEd+3g87j+NE/c3E2rg8hxwNLiV/aqryel6Odt64jpWEXnougpu8f4ZHVyaNCsH9/emYY2gMw==
X-Received: by 2002:a05:622a:291:b0:477:7007:7055 with SMTP id d75a77b69052e-477ed7c96cemr130037061cf.12.1743445658865;
        Mon, 31 Mar 2025 11:27:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a4446sm53218521cf.80.2025.03.31.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:27:38 -0700 (PDT)
Date: Mon, 31 Mar 2025 14:27:36 -0400
From: Gregory Price <gourry@gourry.net>
To: dan.j.williams@intel.com
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, dan.j.williams@intel.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	linux-cxl@vger.kernel.org, david@redhat.com
Subject: Re: [PATCH] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z-remBNWEej6KX3-@gourry-fedora-PF4VCD3F>
References: <20250321180731.568460-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321180731.568460-1-gourry@gourry.net>

On Fri, Mar 21, 2025 at 02:07:31PM -0400, Gregory Price wrote:
> Device capacity intended for use as system ram should be aligned to the
> architecture-defined memory block size or that capacity will be silently
> truncated and capacity stranded.
> 
> As hotplug dax memory becomes more prevelant, the memory block size
> alignment becomes more important for platform and device vendors to
> pay attention to - so this truncation should not be silent.
> 
> This issue is particularly relevant for CXL Dynamic Capacity devices,
> whose capacity may arrive in spec-aligned but block-misaligned chunks.
> 
> Example:
>  [...] kmem dax0.0: dax region truncated 2684354560 bytes - alignment
>  [...] kmem dax1.0: dax region truncated 1610612736 bytes - alignment
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

Gentle pokes.  There were a couple questions last week whether we should
warn here or actually fix something in memory-hotplug.

Notes from CXL Boot to Bash session discussions:


We discussed [1] how this auto-sizing can cause 1GB huge page
allocation failures (assuming you online as ZONE_NORMAL). That means
ACPI-informed sizing by default would potentially be harmful to existing
systems and adding yet-another-boot-option just seems nasty.

I've since dropped acpi-informed block size patch[2].  If there are opinions
otherwise, I can continue pushing it.


We also discussed[3] variable-sized blocks having some nasty corner cases.
Not unsolvable, but doesn't help users in the short term.


There was some brief discussion about whether a hotplug memblock with a
portion as offline pages would be possible.  This seems hacky?  There
was another patch set discussing this, but I can't seem to find it.


I debated whether to warn here or in ACPI.  This seemed more accurate,
as platforms could simply over-reserve HPA space to avoid the issue.

Thoughts?
~Gregory

[1] https://lore.kernel.org/all/bda4cf52-d81a-4935-b45a-09e9439e33b6@redhat.com/
[2] https://lore.kernel.org/linux-mm/20250127153405.3379117-1-gourry@gourry.net/
[3]https://lore.kernel.org/all/b4b312c8-1117-45cd-a3c3-c8747aca51bd@redhat.com/
