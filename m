Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C79C0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090678; cv=none; b=jXpW0MWK/Ekf1FwWH0Elr92m1FUYGLUK/b8APJQIX9p/lK8ZLt3Hoh4o72CI5EU1lb/obICelfEgAlGqCU+dQqIswz7VyjxkmJu+wtnNFT6NH/SGE3M/zdUJj11ciCVvMInOMnI/hsdyuQOok14oXzJfDAmJqgVZSy7Ct7B3Nt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090678; c=relaxed/simple;
	bh=rMGiYZrb+VOtZjeGlqq99efTDqotpC1jT2TKbiFQb6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Qgle7Qku85K8tOUdlvf/hCtcW5HGT0WFx/YhjXhvHGgStkJN75JETpRptxNv4UWhWvH150BzMkY6tQMKjoJ17sEjqqL65g/yfaeHmSeDaCXFgZShgBOkoAo6ugPQ9GFhl/ctE0txwpBojPGjl8gcZdp+udhL3evZ/VXSBz01730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGvnXpKO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGvnXpKO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb94bf7897so11444266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746090674; x=1746695474; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rMGiYZrb+VOtZjeGlqq99efTDqotpC1jT2TKbiFQb6s=;
        b=GGvnXpKOv0XBoocUeCZCWo3e2khWydnkBpEJ7wwEDevgpoOmahhTdR6BcP9F9YbLBQ
         e+cDebkX2nhAluZNOqIlqGSnZKaQ0TZw4j4nymsolj8DpKQzX515OCEaxG/bK9brOrPz
         kvGAuK5/gl16vnMMCZ5efpXfRZlRZemDKY+z7PbKuGeVSZCNqfGNQBjQ5y+iphWYz4UL
         RGD8hGzRc7pzPt7IRB9jqNu+W6q1GwsNYltJPvYl2yL0sqw4kNh6RN3HvS8T0EFLYfuw
         fZSH+Z3jZKPcSXfhYqa3fNs3nPF1xClF1IIEO5ryIAhgYpBSt0VjiANhOoElkLjwjggK
         /gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746090674; x=1746695474;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMGiYZrb+VOtZjeGlqq99efTDqotpC1jT2TKbiFQb6s=;
        b=swwoV3/PUk16bj1y4ZILAmQiGgkG41wmpQCVbM63a1HLXNh1o1X/AkTWlqRmJOONI+
         Unb/kZgxEVndqLbXgGHPQk7/lQASR1Ok4oaAkpqrmuX33CQL4O4EgWU9MvpBwhavsw5v
         zY3JADiwAg7QgkFCCkusnelQnoFqgrzRT9VLLG8ZZ5Ym/uGRsZnOk+liFBiCCuE+LIfz
         jDEf4x3B4inCAw+2BZZGSpjCGcU/owXLk60yfLUmMmwLsdeTqkZ5uP9wVrUcfDTj51ox
         2obreiPIdmIeVvUA1ve4kT9iWs2aZZ6Fo9x3wdPXEQ/9T7cF4G24MbSixA9UYKBtFJ/E
         K+jw==
X-Gm-Message-State: AOJu0Ywwo/uKNy9enxwhg421xgfVBoTlz94RLZzwFcbwj/xBTCArRP2n
	6zPCrrXjaKx+7jKe2vvgHwUqy2nxqXco7itxlD24UF6msSxEFiz9v9kFU1UAdG2byA48En/dpbG
	oIeZOoMRQsSmyKZfz7jwyH5UdfXT7orVhDag=
X-Gm-Gg: ASbGnctjo/fsB6EPs3Xcjfxd0FhdN0CGVcChI+pErTizH2p8m+X4O9CfcTBBZfPaiQl
	yBCPXXR1JfI0dIPII9kmyuHri32p2igcK2VUvZ2Fv6podEXDGouYnvlAkTpQ2cjOz5jC85HAnGy
	kfjJTFdCkfxDvJr4iVlSTEPgVjRF/vq3M0Zz4bHGQesOJ2dCIG+saV78hLFZJsg5Bm7N4=
X-Google-Smtp-Source: AGHT+IH/oB+BrmmPxkMklZigrToSHy2oChn66esIeGPe2RfW2hJk0s+vzcDMW/cVmNeCXAIouoqTQAS3Wdq3LePtyUg=
X-Received: by 2002:a17:907:9809:b0:acb:6081:1507 with SMTP id
 a640c23a62f3a-acee24b461fmr195844666b.10.1746090674499; Thu, 01 May 2025
 02:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vikram R <gvikramr11@gmail.com>
Date: Thu, 1 May 2025 14:41:03 +0530
X-Gm-Features: ATxdqUFcoBYTqsPN3u0LqJtbaIEXnZkSUBOq-28UkOwbh90BSSUnTwcZgm271YA
Message-ID: <CAB0YHExYP7hHb4e_zZGxDdjj6=m0nQJb49vVh+dUUnCbFzSTrg@mail.gmail.com>
Subject: =?UTF-8?Q?=5BANN=5D_ASIOS_=E2=80=93_Open=2DSource_AI=2DNative_Operating_Syst?=
	=?UTF-8?Q?em_Built_on_Ubuntu_=E2=80=93_Seeking_Kernel_Contributors?=
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Kernel Developers,

I=E2=80=99m reaching out to introduce ASIOS, an open-source AI-native
operating system built on Ubuntu. ASIOS is designed to optimize AI
workloads and is intended to support the next generation of AI
systems, from deep learning models to quantum computing.

We are looking for contributors to help build the foundation of ASIOS.
ASIOS represents a new class of operating system designed from the
ground up for AI workloads. Our vision is to provide a foundational
infrastructure layer that supports increasingly sophisticated AI
systems =E2=80=93 from today=E2=80=99s deep learning applications to tomorr=
ow=E2=80=99s more
advanced cognitive architectures.

We welcome contributions from the Linux kernel development community
to help us shape the future of AI-first operating systems.

Whether you=E2=80=99re a seasoned pro or just getting started, there=E2=80=
=99s a place
for you in ASIOS: Code contributions, Documentation, Testing, Ideas
and feedback.

How to Get Involved:

- GitHub Organization Link: `https://github.com/asi-os`

- Discord Link: `https://discord.gg/rWuU7cWU4E`

We look forward to collaborating with the Linux kernel development
community to build the future of AI computing.



Best regards,
Vikram Karlex R
Founder & CEO | KarLex AI, Inc.
`https://asios.ai` | `https://karlex.ai`
