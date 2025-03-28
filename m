Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE3D21ABDB;
	Fri, 28 Mar 2025 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164025; cv=none; b=ENcoCuSMThAxUgbcHBAlJkMPCFUotVaj5kHqsLdxWJbVQ0zYnAUqtRHtxK8l/0vb2l5BHr/C1NrmSNvJxhrk9B+3GccDG7CmXHCidQG8n8m9huL1vAjqjgTnlQwvTU2GvuiRoP1zH8rU2nVl/Qp3m1t+Gd6t1JiFLZglmMrsRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164025; c=relaxed/simple;
	bh=GZBdXCOccaLT3Rr1h5UZpHp+P0XpQdOS8rWPxo4GXio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CA+jLCYocZ8NLHhQXJbu0upSc0U1Vu5TNObMCccid0enEc8VCTary45ta/pJr6/HsLFi0baHgS/lgyRgcxHdZsqO59o5n5mMTOtUvXPZMKeb5r+3QIHwfI6zZV+svj/yAwnmFdbuwfFDC+/CYc8MhmiJe+cEhouS0Kxjz4L7DHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dakdayIW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dakdayIW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso44822495ad.2;
        Fri, 28 Mar 2025 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743164023; x=1743768823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZBdXCOccaLT3Rr1h5UZpHp+P0XpQdOS8rWPxo4GXio=;
        b=dakdayIW13JAquXH9os4R2YUr2vEemtHoJdyG2pap4y2B/TkMfwsbcC/7XzvLV2hgS
         5qMzd24A3ZfyK/QdcN3sAfbi5iEuhvNOC4A0jBN8bon2QjCVP9DbXeeq14rj/kP+sH7C
         vuBqCwveDabhVAQo47lSAhgRjMbcjNs088wg1Yxf/qxLXlgi190Z+qXSdiGEer8OCZvN
         9WmbO6kgCI3NqKTujQJnYPkZzqPo79xdC6xGhZML5I5jPPsk/V6woqEi9Jgb5qdpD7mC
         GW5lfsUXcSnD72SXbZfjfnazC9lO5NRmU4hFT+Y23GfudweyZ+uGEGCt18DfWmYT4fJr
         PkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743164023; x=1743768823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZBdXCOccaLT3Rr1h5UZpHp+P0XpQdOS8rWPxo4GXio=;
        b=oOpGqg62UOyxJ7ZgOXn9cLCVfXzgH4Pscf/iiQEtg+bmTEgoctA9S/s8t4I3VWsS0w
         RGImZzlDEu3SsbNug0+MklGfH4sMd2FIvARWOq9mR+SjwCtwCPWGeef9IeV5hTUVLrOS
         kpKE/OdBPRk/5NafdAKoPDzDrN9jsW353tU6kfUU6VcGcIAZ2S8oauLzLJZY9lmvX6jp
         WilYLSvNuCZKXaki3IXt5c1FTmxrksPmYO+IlLkaTk2slXdnJ/6tfTJ69llRt8Wfq5Jd
         ieIWACQius1LNJZIeHC3Y5LkL/terdDyPVI9g6/u56yDQhlsPKUeAXMeIFYBzMqPWyMw
         VYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCj85HUIhE/a9u2HrKCB8vsqbiUVtBzkhF5TjeQ9ZOlTT9Ej+lSpm1LS31Q2Izs+xTMsKez1HAls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4PkClZVGbVCEqCOiVSo7r6ygsmFBCanyuSA+yxXrad5Aet5KH
	XGmVfVsePwPWf24Jlp6jq0wcUqYbd+nvw2EEJVcEIr39TCcVnHj1
X-Gm-Gg: ASbGncsFpZ0o/P4XApqpXZOuSwNtvnH9U2DK3NNJsMNn10HKF9fCB1HqhotwwgEunDm
	OWus3U5P0cAbKASHrNjTSCBh/4O3nBQkPzz8ZrhGMr3Voebwv5ADZKeir4kIe6d9EpSGT6tON3Q
	wtY72MgHZQws0X2NqEt/D7MEMo0kEc2XUlglzpHTBj3DV3EdUBWHPMgltmDUHIJRLS0SSM+TTkY
	m2gBjMBY2nyHSxvnDBxd8aVxlJ2UIXf15QTd2l5i6+4mDCFjjA8i8rPdorNVINMnYc0ODHfo5q2
	PpFAQLpzoTeb7E9yYGRGzWjxDumbBlisS49xKwyb8pwL
X-Google-Smtp-Source: AGHT+IHbhHRwAGXrZdFekxoHGN2RLxCEHtVfR3r+fvK3laYBKmHAxg+tc60qZiJGM8EyQfC2jcYuEQ==
X-Received: by 2002:a05:6a21:78a7:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-1fea2d7e078mr13376889637.18.1743164023158;
        Fri, 28 Mar 2025 05:13:43 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba109a8sm1217447a12.69.2025.03.28.05.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:13:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 55116420A74C; Fri, 28 Mar 2025 19:13:40 +0700 (WIB)
Date: Fri, 28 Mar 2025 19:13:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] iommufd: Fix iommu_vevent_header tables markup
Message-ID: <Z-aSdBvgnMSyT3qL@archie.me>
References: <20250328114654.55840-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4gh5mVGi1XsFFdpR"
Content-Disposition: inline
In-Reply-To: <20250328114654.55840-1-bagasdotme@gmail.com>


--4gh5mVGi1XsFFdpR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 06:46:54PM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings on iommu_vevent_header
> tables:

Oops, should've been s/iommu_vevent_header/iommufd_vevent_header/.

Sorry for inconvenience.

--=20
An old man doll... just what I always wanted! - Clara

--4gh5mVGi1XsFFdpR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+aScAAKCRD2uYlJVVFO
o2OoAQDP2ICoV65K5DWjBVDKexlZjQTgjJAtUOo5mVNG2VuFMQEAm+paxJ8p4+zY
T6B+gtKIRHsd+m4GuKku8jTuWWyoFAk=
=81w5
-----END PGP SIGNATURE-----

--4gh5mVGi1XsFFdpR--
