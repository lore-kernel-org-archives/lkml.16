Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528612E0B40
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844193; cv=none; b=IsMtuFywptvB8uXVnCs5kz7sX8YeXCNFfnMYsnYP41Er0DsHD+vv+BU2TdzXJCEYZto5WyCUeQEyLsEd35M/2bE9SLjLGAwhxR00zMgkEtZK8phnJKdjqC71zMn2kwchmDgdtXX0xwmhMGObIAe7OVAMOurv78PnhLyHbjcTMiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844193; c=relaxed/simple;
	bh=RQ3iT0UG7NJ/Ite3fuPfgk6TqKd1wZf9NkwMNXuArK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=iGCJ628ClaDUX16gjI1mIszYjuI9SHmXv+WWJRJcNPkjCzHM3JkqLSko+gWkHy7b4RF9EUKAoA4Li7Sp5fm66Msg8zUBR/OUk+sYXUJfDRQhm5tB9kon6t4MoOWbrngtdxgyjIbBE2X55ERlItyFp1F8tnJra8UFEJminBCXMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv5hakV+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv5hakV+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso2751107a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750844190; x=1751448990; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQ3iT0UG7NJ/Ite3fuPfgk6TqKd1wZf9NkwMNXuArK4=;
        b=Nv5hakV+1N44syjfPvW8HsKXSxQhO2TaX5kw64w7Pb/Xd5RfQBG+d4zpBI8pmByEub
         vW5dYtX4CTfZBo0jX10nnQlHWnWNqimvd6bHwenQaJSgBUQj7UHpu5Ldpq12qw1rZvLp
         W8036CpqAxbBTH4Aq7bYj2OH92tug5BfudrCD1EwG3eeez46YCpGHS+k8EB1E9PDwnWl
         u6Fh69oUA1d2ciqkIjYMCaVlFe3hTDhnnkU7KQ9bFzFJFzQ6NYQ9Zn0ijk0j/n7yydB/
         /a8G94Zfiijttq9DVDV1RSHJ82kX3M51vbEDn66j5nSNTP1SRwPMB7t3Nf+hdQNgZ0mJ
         lE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844190; x=1751448990;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ3iT0UG7NJ/Ite3fuPfgk6TqKd1wZf9NkwMNXuArK4=;
        b=fqOh4Ev4JydbAAdl304dvLzVn9rqVu3d+yiwGrXnASicNytZuE8ghX+u2fBUtrNFBq
         Amnb2HOzuDgsLO2dymE7Yq9MleTZYr9QXsR/HM34ddJrH5bTeflxWIe/NCvCmRz3yY5j
         quCGEM3ikP+J5Y5Ue9WZ6rsAu9ukG31hMYedmqO9nKRLJAN+cTvgPKv+ZI913BNcL5+I
         Anx9pnG09Wjs3r+5s4hlsCbD4leFgTKZ2uxNBA4SlER7i/6W6lI2hL5BTqo/aYE/AP2J
         2Tu2xxmdnMnIXAeEsl7LrWOMWuNuzSBnxkJFne9rkRNDrl4tNlWPRRMiXF8WWCo/H0vj
         j+dw==
X-Gm-Message-State: AOJu0Yy24oIOJYRJz40NfBuVJmhCvzQpVqc/nujmZNQO17Vj9YWfn5sW
	mB/Tge+gWCa5ettEkdcCycNXeJbfwpwTslleKIn/mRTiCIw0/PeNzJXYPSRg5jiZFfPAuxD3DUf
	bc5hXkoUw8xg8IcBGbI0oRs3fq9CJdGT3UsVR
X-Gm-Gg: ASbGnctCjQJ5hWQmiaoNHqIu4/XLar6xAE7hufQUojR0DxiOiTWQKYSisotrrUGhHPf
	Uj/ZMQFl9tnqyNNmrkUaD6wzAgY9gt1NsnSc/AyZgQY4xFB/hhjrdOZDJHuylUYidCvmPs/ZG2V
	BBw+RwHL6USsCRuQ2o8olfjeUOKpPYODsteOe24cvqNeyx9GycXOfzgCGYnQ5pm+m70Uu01Y2DH
	As=
X-Google-Smtp-Source: AGHT+IHlD/AvGbpIYctMJb14M9ZIbhT7/a/vP5ZRC6CF8XcY0KjIs1ffDSmak0jD5E586YHnHBsw2TEqiA8vr0WnN80=
X-Received: by 2002:a05:6402:1e89:b0:607:2e6b:47a6 with SMTP id
 4fb4d7f45d1cf-60c4d35a75cmr1685783a12.8.1750844190199; Wed, 25 Jun 2025
 02:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE_SDzhqE0JTrD6gxb3Azk-Ld=sZBEJ04AxeXNMx5ndev8u6hA@mail.gmail.com>
In-Reply-To: <CAE_SDzhqE0JTrD6gxb3Azk-Ld=sZBEJ04AxeXNMx5ndev8u6hA@mail.gmail.com>
From: Andrea Bravetti <andreabravetti@gmail.com>
Date: Wed, 25 Jun 2025 11:36:19 +0200
X-Gm-Features: Ac12FXx-bzUt-I4KkcGioxds3FSnb4dzSbeP51zUXwpA7oLRxub4-qsVW_gxdoo
Message-ID: <CAE_SDzjaDOM7BdT010GATG+QJomsP+4tseaXwaTN4GNv0wZboQ@mail.gmail.com>
Subject: Re: Dead external monitor on Lenovo ThinkBook 14 G7 IML with Linux 6.15.3
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

More details here:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14519

Reverting commit 604981bbaba1 fixes the issue.

thanks,
Andrea
