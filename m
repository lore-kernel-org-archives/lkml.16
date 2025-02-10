Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85422E410;
	Mon, 10 Feb 2025 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195290; cv=none; b=bbT0tpn3Xzr2srTRNDH2ntKJrY9yQCmtsSGOGvGPZoeIGjI2tud6gV27MGmYYX4XwEYevrgS2yjmWurtEbX6RM9+3Qrueg3WLeNSmLyrg9i742DfyI6SX6NWcB1dQC65dCidTgJp1iraFJrFeb9A6fEnyQ0TLwA1mLeIet7+4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195290; c=relaxed/simple;
	bh=unIOnduqOACNsKjlATI6VDt5jfYkpCM9OsK5B35BOKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oshEpgdcbUEyT8AEVPHVEz/WXdtbzGGkNBBKOoGIotDJzBMjt+wFccPmPSA/w+hYKUaSyvkPVnRQ6jrA8m/zLcvwGqDkNDOhhKwN9INR9zzz6LuiqrcPGbllGYnjT6l8Za+A4neGDFHZYqOj2OLiYGsfstTFnSiK7qeogd3A8w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThdmfBDh; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThdmfBDh"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6efe4324f96so37099337b3.1;
        Mon, 10 Feb 2025 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739195288; x=1739800088; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unIOnduqOACNsKjlATI6VDt5jfYkpCM9OsK5B35BOKM=;
        b=ThdmfBDhkMGrdITdAdoVOzhzKjP9xLs1PWfKmlAu00kACfyWgyWumTUHS848JcdKd9
         oyBQGkFizsRmxH40vXSRJCsQus9Q9WfsucQw5Xus0QZSK9w46hC7ecrG6D7wDHkYvMRJ
         VXKnBHXUnEQWTF4SC6Hkb2YzdEKwdmwY6XCgrr8+YLO0U4vLHTgBBy8leRTWd+J0Kkd4
         nSWqmWv00W5EiWxBuj3cSPO0lR5+98bcc0RCyB3RswB5zQEYyduY6xspzDIKg0BHzBz4
         vr1YjqCgMnVfZHK7wE+c2R9ZMVB7paOhMKXDNkGyNeuwH7QZo7lC0IQZQ/Zof6URCZhZ
         sj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195288; x=1739800088;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=unIOnduqOACNsKjlATI6VDt5jfYkpCM9OsK5B35BOKM=;
        b=uHPZKkpiYxQu8R8CKPp7XdCUN6tBojJdBeY5wbmzDYBpjoZ5s/pBIiKZjruD2F10/K
         Ob+LzbHSNAUq/HHcWsksAPziyV/5/VGWu42Lrcjq+LIg8kgKdX99BazzP31mqkBizMZi
         XUzDP0FSvxLEt0DO8cOE8vp27VWsZBk7h99ANBpMCBmt5QZ5nCBg3lGlIS48auqLqsBB
         dV0GplJQ8FCrXMPU/v3dgx2CDC9mazg3gZrfa3aUabL012jwxcG+CKYpmNeXLd90g9wS
         OShCp92Uno6Z3cpPgJDCH28+y6uuZOKrUlOvDkcKIkUfWUytTBFnv3rwDFw+HYTblYcP
         npvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHr30Lnq5jYYhQ1/7hW1z+ywobyKIfJEmPzsttUTNfxrAeeJDbaG2hWnF+3VhVjtymHhYmJJ8xWz+7Xdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweG3tY6qiRYzRf+OFJryLUDzl3O2DO7C8jg1q+yT61lD6KNngW
	1HNHBvi8FefD+Y9hwUT/hiHTJFTFiiRVE5BnnqRFTuZW7hKFk2sr
X-Gm-Gg: ASbGncsKIz8sVuib9CC/gVAiEm11j7UyJjTPDn08I/exk20IrcwPRGS72+XTkE9MfYL
	7v1Y7q/Br6xmK+3Sc0SxXBDS8OlONWBLdm28PFsx9qgqcfZe0fAcRAzCkPOgnNOqDKmkzubykIl
	gtjwmuMq91NFA2W7u9XjiBTAt+QAFsI7Arh0MuZeIXvZBYRSoRAgHFPBHRhTisLdXI/Pej6IUBO
	/0P+gbSB00ldd4Y9Qgqev6eKxhVUZehdCCs8jPvhHMrA9OH/Sl8dwIQo4J0Hhs54rFjoEJZdn4n
	CXGqhuw=
X-Google-Smtp-Source: AGHT+IEucBPRrEkKdOb7Xxf9J0slO3KfOlYwPbCpT3xOIddTJvyY2eX2vBLAHHCJh65cA6fpbfgGeg==
X-Received: by 2002:a05:690c:4986:b0:6f7:409c:f647 with SMTP id 00721157ae682-6f9b28021a7mr115776817b3.3.1739195287623;
        Mon, 10 Feb 2025 05:48:07 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc0aeasm16508197b3.96.2025.02.10.05.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 08:48:05 -0500
Message-Id: <D7OT9WA7NKIG.1HK94X2IR7ZBX@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <fd4524a6-0b1f-d929-61a5-b1ad188c938a@linux.intel.com>
In-Reply-To: <fd4524a6-0b1f-d929-61a5-b1ad188c938a@linux.intel.com>

On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Fri, 7 Feb 2025, Kurt Borja wrote:
>
>> One more correction. I apologize for the noise!
>
> Applied to review-ilpo-next. Thanks.

Thank you so much for reviewing this, Ilpo :)=20

--
 ~ Kurt
