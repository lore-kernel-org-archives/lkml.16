Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E42288C0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 05:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668824; cv=none; b=fxU+v+6i+j3/yapsbzc8SvPNJID9cpjeL4hlGolgHUTHMrPyasBSsk06mD+pdkx/CmB0CzqeKHSJerTNF0+BsgGXWgYtyVeGcdy1zL/bC6xPgyHd0cqn78b0w7TTTIlbCSB9HPmXfWkbF9fTIl3AxPWgA/2dpzEXGA4XwVwU+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668824; c=relaxed/simple;
	bh=b9ukqDvrkKLIVbh+PT8qxjXuVTRljNucBJtIcPquS/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTcTVYNOi9EjBISz7C35QKfxaJgYcRIW9dXH4TghQuTMH3mfm2E+yDrUqesN5hm0aJ9Qql+HRAOpr3EbU2C9EqLHATPdAJ5TZ3k4ws6Fzh5sK4D493b65ko8baDDF4VYSK9OIiY2YWnmqDr4ecJOTsg4JV3JWZs1sYIQFGdrlLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Heln4wcl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Heln4wcl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad5740dd20eso395074866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748668820; x=1749273620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEfD/+DM5D2k/gXm81XhYIsGawr1I/4vC95VspHPajY=;
        b=Heln4wcl4oXb5TPBDYayQL8v3GDEqa95npdEzU34DVMCSGykXL0xL5XNZxNUz9kaDo
         YwsO6jsye6OtGW442Gflddqm0tbNn1PktWPBCMwtVpkc7S66ySS37t8GYZsxU7M9jqRr
         LTKmLczrz+eoNcIGuQWDx1s4xHmuHqJTbUvJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748668820; x=1749273620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEfD/+DM5D2k/gXm81XhYIsGawr1I/4vC95VspHPajY=;
        b=MtxmoPTRehdsQu49a6xEhOmC/zyAMiUe2qXmAhKReHebp2+UY+NIVrpBKkL3GBDT95
         OIW43ZqmAbTEABF+8W7/xYAPoVmo1bd/vxDD/WZPUcQfcavP783QQAL+7bzDX13XoeXf
         m4VRJ11BGy+zmCLFpg1fL7A2CrFi4WzGeVaFB55+WU5CbkZKE7Qq2NXOWqCHlRIrcqct
         /ewb9ptd54zKIzLcwNTfnHtXedHLJOC6zZXFQalUXS4jxTk2BpmPBe4RpUuPBs9B7Bh5
         ww0pUNIMlyJ1b+7y8EGCO+IuaShfrqNKOqasN6cgcdJmRYYFCUOoy6ZKV1yYBnm0Txnq
         2MfA==
X-Forwarded-Encrypted: i=1; AJvYcCVG97FlUykDIeqd8yGyZXYy22dfUJaWbW1vFHfVFi3rnCEGM1VBTtLWpbLal9Reb1SHIW49VJHo7WPmKJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vAfEfpZQ6lIevl8NuM+2ZLrh2wpx4Em19FUcbyBamikvB9Kp
	zsm7LuhUZltIhcaJ5theURP2itp10KOhPJFl2YMMD4co8uilwoQ3Zft8v/TRjuxp2FvmgfWX97X
	HlRMaNnA=
X-Gm-Gg: ASbGnctDoN8V8jbbN8P12UPVqNTtFN/e+pCfqg1fDU0W6wKKm7r+KiONewww5cmgiDK
	XC1fNw8rPqn9LEvsWDdnpc2Msx1XjoTr31jhq/+QQtkO/Paplz/gvA2w3mfErYS6VuFO/aLHW1z
	7pAEEXgBN7WlxqOE0aTAHKi0l0yffjP0ScVxA8k+CT+tCaa+6/o7ynoXD9aUGuNkGiiipz/yL2d
	EXo4OdeB+AMMDMKN76HM99bRlfuQ4/PFCnmd2R2BN8CvEwc1TEhIjFoCW/w/cjMog2AR1JHsNA1
	CydXww8CNPlOEXql1eomMCRYa+qecYojGMBDpyMxUIQwoJewb6GimsoKsQCDUyfK2dKZWgpct3F
	HL3Mdh9r9oBrIhjZWzGfBWSgpNy8LqXmUrvL+
X-Google-Smtp-Source: AGHT+IG8DlWx67ttBPaM7I8fk5rCpu881EEceHrPni129PVCOq0p2B27h8FfZoKP24iylWkZL4zPLw==
X-Received: by 2002:a17:906:c108:b0:ad8:932e:77ba with SMTP id a640c23a62f3a-adb494d647emr92285466b.38.1748668819986;
        Fri, 30 May 2025 22:20:19 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84d1f7sm436142666b.74.2025.05.30.22.20.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 22:20:18 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6045a3a2c5eso3529478a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:20:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdftdsa5fUgq24Hsccn9RrFMz4PHURxVL6fGjzlJY4aZHibVpGbJNIej3/cy4YFgONe1GFvqH6u2EPMdc=@vger.kernel.org
X-Received: by 2002:a05:6402:40c6:b0:5fb:3a35:b8d8 with SMTP id
 4fb4d7f45d1cf-605b796da8emr804228a12.20.1748668818330; Fri, 30 May 2025
 22:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDmght5YpHmJ6qZ2@8bytes.org> <CAHk-=wguPX5w3UVmQpOk+v1ahJwRzRNXKHUJB92cwJfNpMU4ZA@mail.gmail.com>
In-Reply-To: <CAHk-=wguPX5w3UVmQpOk+v1ahJwRzRNXKHUJB92cwJfNpMU4ZA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 May 2025 22:20:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4qRwm7AQ8sBmQj7qECzgAhj4r73RtCDfmHo5SdcN0Jw@mail.gmail.com>
X-Gm-Features: AX0GCFv-R_VgM748qQ2znX8oK1KrQk1cZwPxjrDOqD14wEHAYhom0j694KMvVuE
Message-ID: <CAHk-=wh4qRwm7AQ8sBmQj7qECzgAhj4r73RtCDfmHo5SdcN0Jw@mail.gmail.com>
Subject: Re: [git pull] IOMMU Updates for Linux v6.16
To: Joerg Roedel <joro@8bytes.org>, Rolf Eike Beer <eb@emlix.com>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 21:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Bah. This seems very broken.
>
> I haven't bisected it, but my arm64 build - which I sadly didn't end
> up doing earlier today - breaks with modpost errors:
>
>    ERROR: modpost: "arm_smmu_make_cdtable_ste"
> [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!

Ok, bisected to commit e436576b0231 ("iommu: make inclusion of
arm/arm-smmu-v3 directory conditional").

Which explains why I didn't see any obvious code changes that would
explain that.

This is with a plain "make allmodconfig" build, and I think the issue
is that CONFIG_ARM_SMMU_V3 is 'm', not 'y', and the change didn't take
that modular case into account at all.

I'll revert it, but I'll wait until tomorrow to see if somebody has an
alternative fix.

            Linus
