Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDE21FF57
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300686; cv=none; b=NkC5kKKWUznpioW1MCZexAw/MRdOxDgZXIP5uQv+1fVdVwYa/jWgt1Ouj1C0fq5do0t92lmAG7JkT5mGr8GYdg5EnBucZ7PJZcYrN9luD5LLeCYMLmv6qiJMsve3xQZEPJq5NJr35a/tmFE/DHa/zOl5ySA2mEANIaeWeKomF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300686; c=relaxed/simple;
	bh=R6t76eWH2HzIq2TB7HLKHxRY/f1IWLs6nx6TUFl7QAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjWTVlie37/ppbBVt3kJH/NWD7G+f0OYJpppedTYZhBGCx++2YDLCXlqz73Nbxja2BI2cJlItApzWpTx1GBRk8pdhRbcBqTrjrmblp0vjYDvF6JDQMzAD3Plf6+MkH/qiCrmYVYKeVAmhK783fhnEyuHJSQxwi5AmbAf7HEjLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rDt6uPh7; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rDt6uPh7"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-711756ae8c9so3115737b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300684; x=1750905484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=rDt6uPh7hjhj1QiLe2docWIq9u9ltGOoLTZgCDpB2/t2jTunoLTIlspQ4Z9YofaJ6f
         ZRySfv5+AUPDIMafIiILhsCGQDFNZC6++EeSCTkvwKvBdr83H1GfO41tHUXCYYXUFDXB
         yxmlA2gbwDOtlrx19Z2vNDfdznH+epTTT7oQwVL5Ezujx5BcC2CzaI/GVOxWtCVkL0eF
         E14A/QWQJQxfqQrXnvbGszEfBibMd7e3X6TpXET8MWct7oCplo3rf48IJEpfeL2W3MXX
         SCJvZcm29xLShaG/kMSlin3xOdzKaD+XMVJEcqRpsoo1mTwM/vGSz5OxQKQGYUk+vwrR
         DXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300684; x=1750905484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=oR4TIliYaPjOCBRfpIhY7I6UTzDZCgweZgMbNZze4vX3B+kcFmOFp/7u/8ct9cGEF+
         jXo59Nz4qN6ZbGhB0DH7tZaethXuSv9+JqgFTHkm9L96yYVLr9BCt5ISz5XOSEkT4nyt
         aR56en/QOg3KwLpYaGeapze+B/c0bCeve1mFlvG8hLO8AqRKjNMbU2arGTkvdqYameKa
         Go6lXgfOP1cK17j3WzQJ9hNH7KN5big+785OejAhC71nzV1IvBKqRytC3eySQNVWMMvq
         +nV5Bn04UrHnTKadBLnUsYT0DFkd2xf4noqVrWzkNc7Mc7Nytep7sKtvE9V7NWddn+RZ
         MjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1R5mw4QM+mNGT4+HsBL1Odirf8cnJMOULFKi+V1SmLzcUmVpoyO2/A6AsS3Idg+0VeOBoTMwL8cGacF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxruKQ0C1de9HfgrNB4hUsYrGjtDt1kQqto0H6YBXce6UjmPyIs
	OgHLvURhr2yw+YmKQ2NsFjBBDKAssUaxFkyEMt3FkOa0l2qRKUwNRzSOkC4dqZbYYZLizrt20eK
	4eVMuM0w75W41mFQUK2gxeL+dxJ2VbxpJycgwQbdFzw==
X-Gm-Gg: ASbGncuFFS8u4N4Xh5XdO97IKQuSyAC5Q/q56mSzy3w1L9sow9zfzE2BX0bc6h811E1
	fBXQMLIfit+Rh3vcxsF4tZgEVsnFnaAe10EC6qAc6eN+XJgPFO/j5MoUyhZ5G6gZ/YwbcJDw9RT
	DEQYHyDmejnBV2vdVqzynY2i52qf0ah4SlzcNMWUIaXgisUXhw/RF3
X-Google-Smtp-Source: AGHT+IFLz3Vl5G1STkCpTHnFizE3p8mAf9pvpCYG1N2QfqDuoM9RrsfGR/H2ltgphKQYCTDpc5ZM+HFUSOw07SlczgM=
X-Received: by 2002:a05:690c:8e0d:b0:70e:7503:1181 with SMTP id
 00721157ae682-7117543370amr238070227b3.18.1750300683598; Wed, 18 Jun 2025
 19:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-5-guodong@riscstar.com>
 <aFEFBss3RT7NbQkV@vaman>
In-Reply-To: <aFEFBss3RT7NbQkV@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:37:52 +0800
X-Gm-Features: AX0GCFusS0Wf6JwTzVWm3sY_lYpO92NDTczE7xfKgCKObXd32EKaOhpP7K8QAJc
Message-ID: <CAH1PCMYL57eEVyx7qy3offcsuKsN23qO73H+YTnffZe4kBxzMA@mail.gmail.com>
Subject: Re: [PATCH 4/8] dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:02=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 11-06-25, 20:57, Guodong Xu wrote:
> > Extend the MMP PDMA driver to support SpacemiT PDMA controllers with
> > 64-bit physical addressing capabilities, as used in the K1 SoC. This
> > change introduces a flexible architecture that maintains compatibility
> > with existing 32-bit Marvell platforms while adding 64-bit support.
> >
> > Key changes:
> > - Add struct mmp_pdma_config to abstract platform-specific behaviors
> > - Implement 64-bit address support through:
> >   * New high address registers (DDADRH, DSADRH, DTADRH)
> >   * DCSR_LPAEEN bit for Long Physical Address Extension mode
> >   * Helper functions for 32/64-bit address handling
> > - Add "spacemit,pdma-1.0" compatible string with associated config
> > - Extend descriptor structure to support 64-bit addresses
> > - Refactor address handling code to be platform-agnostic
> > - Add proper DMA mask configuration for both 32-bit and 64-bit modes
> >
> > The implementation uses a configuration-based approach to keeps all
> > platform-specific code isolated in config structures. It maintains clea=
n
> > separation between 32-bit and 64-bit code paths, provides consistent
> > API for both addressing modes and preserves backward compatibility.
>
> I would ask for this to be split, first to to driver changes for adding
> new ops and then adding new soc support. This way the two changes are
> independent

Hi, Vinod

Thank you for the feedback. I agree with that.
I'll send v2 with this split approach.

-
Guodong

>
> --
> ~Vinod
