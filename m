Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADB61E5B6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836869; cv=none; b=uKmWtA9TnLuZfasf+6WJYB0TY+BExr023gBTYh/dGYRIRrncryiQD67eFTEzBC1vs3Cu9+eE4jkFsXeQVUiJcNlOPk5lDD6K4KJPyQqtqDJtwe2ydIaRQSC0xzip+k/i2zRLstU9LSWG9halaaQ+kx54LkL6DxstQpvtb+2Pe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836869; c=relaxed/simple;
	bh=RkRgQ/E3teXtjmLDQu0zs02cJ5CyGTii9nfI7+52fL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GF23/yZy6hVGLPY0yKszsRUXVae7v7mwroLtTQitQQ3UVapqmQZOvR3UGiBin74hkG5ykdvSSkF6vd1BveUHKOV9uevItKlCCen6TWz2zBA5BB0Hir7/qS0MyfVragrN7L9cPD7tmCSR2WCsApIyuGi1i2sGUDzD9Rnu76YmrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+P1O2oq; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+P1O2oq"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e8600c87293so465426276.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750836866; x=1751441666; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkRgQ/E3teXtjmLDQu0zs02cJ5CyGTii9nfI7+52fL0=;
        b=F+P1O2oq/senMAKohFKRAqzBsPRYN0Gv5hAqnVNUi5pp/kBp3cb4zo0LchoY9eFXZq
         dPT4gwCrMF+xdeu6PdcyLTbiSlNf6OPDpos//MgUZlo31TZ4We0oaHX1wOqvVT2+70th
         pICZUZ3T6czF1CDxQC6NPPpRfHeAi4dhzHdUkVWqzRv0w5CkVE+xWFDHhz3vH+tweUNR
         4OWSufv0+SfJ3kDbvujvwE26GCOJHyuVPV5PVh93AvRhOrGBFj50eL2lGAlowWNAsTot
         GzzTrk3+aB8NGr9FNYCtt/59uYGk2lTFG+KhsbdboMLBtTymNUtkaTsEVezhkTzBVIAM
         PoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836866; x=1751441666;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkRgQ/E3teXtjmLDQu0zs02cJ5CyGTii9nfI7+52fL0=;
        b=elb6R6HgSqgTax6cnS1cmxae8zGBUgPj2RU9beDOramdWUFR9tzBFxZXs1svuNJ0Sb
         x0lWI6bM2939GnP/kGVvRn9n/kORcHhP8m46zKQLTLdygDsNyPZ2SepPAaE8vbV7KBUX
         QNO+EXZT51QPgrO9XptKbg7QcmJ/PtiQiKPiXHDR8MmxsZX5QgyYeEukcyYew1ukETsS
         g50U0woOP8kNgvjBTA9uXRi305fRpi/iroiPAUs0z4tqiHiU+0C3xj0j+vGaZDCiIChR
         ueQyqPij2uFbgToPtZjn3BrKQrUwokTMewoMrUQJoyHllcHYRwZnSBtvPEIyawDUNom/
         vJIg==
X-Gm-Message-State: AOJu0YwHncU8zNO0j5yGHeI4QKPR7EwwzVmQB7Q8XqKJyL6ghfpAazOH
	6glmPjJ3/rBn3zZoudIOYgEZg/yndv9DnOUL/ZHYkhwVC8RRoY1dspAEixNPWCoxnOMtb/cF9qI
	Bqqm4SzX+QRSG488CGMnNBWVpuw5fB11ZI8Vlokn/PA==
X-Gm-Gg: ASbGncttHgiPQgUEIcsOOQz6btcpbG7B8sG8oNbI4+NZqLaP3a97vuAlLyetOH0A/Xm
	i6++fajZRTohJs+2PbNgPAFUXx8M+JzTZJJ6mg8uVqGZ9y68xzcFVSuQGvz9WaT5mwn4fKuV/my
	91HhyA74/ryoOxRe8tTcQ1YTEyPtxHhHyRpV72CZvlopgtYKCwvTWzfwj2sP2xx0DrSoadwacjD
	D0jyhVore/e5b9d
X-Google-Smtp-Source: AGHT+IFAqtr+8OgfdCZusf1wXl6gxEKA/2wTwpel93CXDCMseqJXPbx4t91/POE0FE/gPG/y+ooIy8i1+AGoxcAE990=
X-Received: by 2002:a05:6902:2e85:b0:e84:20f5:a6ed with SMTP id
 3f1490d57ef6-e8601726faemr2197605276.2.1750836866127; Wed, 25 Jun 2025
 00:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFf+5zhvusE2bPiTA40wJ39UZHCaW+TyiE7E1ZEERQJS9sLcdA@mail.gmail.com>
In-Reply-To: <CAFf+5zhvusE2bPiTA40wJ39UZHCaW+TyiE7E1ZEERQJS9sLcdA@mail.gmail.com>
From: Amit <amitchoudhary0523@gmail.com>
Date: Wed, 25 Jun 2025 13:04:15 +0530
X-Gm-Features: Ac12FXyLIclP9JJomuv-hQ9rk49mqEP34so7Y9oXWIIlBldIrDMd4r5zcHcZ7zY
Message-ID: <CAFf+5zgBTkW3W46xFYgbBzyP72e08gFQd+NRssCnZRm8UYhzdw@mail.gmail.com>
Subject: Bash script to generate random ascii string lines (printable
 characters only, including space) with lengths within a min-max range.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bash script to generate random ascii string lines (printable
characters only, including space) with lengths within a min-max range.

--------------------------------------------------
#!/bin/bash

min=50
max=110

while true; do

len=`shuf -i $min-$max -n 1`

tr -dc '[:print:]' < /dev/urandom | dd ibs=$len count=1 status=none; echo

done
--------------------------------------------------
