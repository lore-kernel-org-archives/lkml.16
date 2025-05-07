Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE8A28A1D3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630215; cv=none; b=ivcDaGSWUW91L48dnI1w6nKUIsOl+KJbk+F5373rIu10/hvs6EQ4BqAoGjvAHnh0cfripJdpzV3hl27nBfM3TW9cxWIBJ+qR4hKUVmM4s8Y4DaHE68Hwe4Y+beJqzpAFsM09TWIOldGl1k8TJghUQWD+kBnFG1RUDp4c1W8Cyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630215; c=relaxed/simple;
	bh=9TaEzQgVFWAXgW4Tf6JaIlQNRUaSUe4zd6IVPH3fzco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVGaxd1ogaJeTcwwR1Zjo/phAgGTN7cNPKu87s0r9+1WcjqUY3QXdtEz+/+uP6sJvBmeOaw3zsi59bMfAeqVMuiG1Ci66zc5baznaiXGfwEIO8uihFXI2KLbUi3pA8LLk71he3fJS8ecP7Ijra75aF0OUW63W1xmDHyebByckR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NmodMS12; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NmodMS12"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e696bbc85so967845ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746630213; x=1747235013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s8LxSgdpw/QFNWhayU6GhU6VvikEqRstbNbkkV5cHs=;
        b=NmodMS12ENTNSiz6w4DDJmdQa/PfVpd0JjfT7278eJpOlPIYZedvsWOBJTJxrRwitW
         0vsRRWpovDVniHjt/oYSM82UuHs0DygQaH6dUMjUr9o9c8igCR57NMeFWwERDfWXm9D/
         CMtfmPAjZ0H0fBAaB53QB3j7EJRADAEuBoLpuTpWu3+OYA3HtkHzIAhiyyrkDwridptN
         L9JoNpmbCDNPad+wrZnTt3Ntf9hrleK0K7KHZ3OOh2HNgwCFx/DvyLv+tcNW9thoMR4p
         C/+/uow3qmz27aNzo6BE2QnkrR17KeBUzYlj0HJynj3Wm/vfVq3tx+tYs5uDLbOnG6g5
         JFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630213; x=1747235013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s8LxSgdpw/QFNWhayU6GhU6VvikEqRstbNbkkV5cHs=;
        b=iRQixiWMXDpCtzlzpu6wjSgpwd/Z0EUypXA4YzKOl5aAbvQThlKwCfzeerPj4Si8LK
         GdWV82yJ/63x7U0wkNn0pMbT9g2GagG70kz+e34TfljRPUXUQQuT6u4XovzzQlnqlAQD
         2FJVCFUnFbhoB0HfGJKZLaryWtsPn6rcBm2CdVL+vn91EX6BdLZGCccdHrVPKdxSDAS+
         8j5nziRvfkb39xPL1m3YmMtE2jIAivcKFmBSfVxD6a6q2BNCNm9Ml3+TB7/uRRlGUIcF
         +WYySDzukGWJc4Bm5X96SRmHpI1H+m0Ney7a2M3atTlLjVd90f1yJ78RpN/SfcS4H6/e
         elSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0IseEMVU9r6amctculKuVI6k8E1w3PMNb3tokpzoo1x+Z3mzdFZ/d3LoW3L6vdlR19BY3dd65vM4anjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBJ7K0dx0IvjjnH6dAchcnV5Ijn5TTRu6VlBF8ZGAAiCtSjEb
	t2Dg95mkiItnk2uFKL0lStq0JPfWLy1cpwyVZd2R/gBrf0nddwKb6ftUtP74J81lCRuts2ZKHrt
	bD12d5bvRL1zaplwQ03rsBhiY3Cc+8mL6gldMzA==
X-Gm-Gg: ASbGnctM0FnTs6NCrfbYz5eP1OWkF6SBiXRPQ40ZZLBl1U94XrNmaBPHiqrWJd8g2lx
	KDKAWoklhBMhIVhQb8EVrr/C4mFdG8V6aem40uNmZpoTiQ0643EUWbZhjV5hykdSSubic53nVCM
	XIPXGoOYZ3ts3cDFUdA/tC
X-Google-Smtp-Source: AGHT+IGVRdVpmD42Zl1K9/CFzNk9/9fbzp0SeC722EZPTJKMkP3YbezVcTCIZOjRu3Yyi3o0XRR2Kv7U8ekDo75qkiA=
X-Received: by 2002:a17:903:990:b0:223:28a8:610b with SMTP id
 d9443c01a7336-22e5ee1cb10mr16787145ad.14.1746630212740; Wed, 07 May 2025
 08:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426020636.34355-1-csander@purestorage.com>
 <20250426020636.34355-3-csander@purestorage.com> <20250507071610.GB1413@lst.de>
In-Reply-To: <20250507071610.GB1413@lst.de>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 7 May 2025 08:03:20 -0700
X-Gm-Features: ATxdqUG1uu45_rIP1595jmow33H5jf2cu-Lb4HqU3C1enyWziA9-fbza28d3E8s
Message-ID: <CADUfDZo+WKATQ4+ZpYvvNWrqBqP7pkBhzfBxyMWQomeLR-qtJw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] nvme/pci: factor out nvme_init_hctx() helper
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	Andrew Morton <akpm@linux-foundation.org>, Kanchan Joshi <joshi.k@samsung.com>, 
	linux-nvme@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 12:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> > -     .init_hctx      =3D nvme_init_hctx,
> > +     .init_hctx      =3D nvme_io_init_hctx,
>
> Without an overall rename of the methods I'd rather avoid the _io
> here and pick a _common name for the common helper.

Sure, that's fine too.

Best,
Caleb

>
> I can fix that up when applying, no need to resend.
>
