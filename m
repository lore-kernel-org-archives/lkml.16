Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51119C57C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867575; cv=none; b=a3SbHNb3TRVA93tNO1T9B4RV4UOckdFbVyvcWzuLwcvDk/mTTKu3Yrqy4Owy1P7n0IOlnFws0Y0iIsaz8iQDZpjbUjTdEzgXqTQ1U9T07VitHKee4oNm1JPUY/oCWjzxhA4VKyjEX9IAXTDa3VORQZXQvwEWxRnp8APAHsDzGXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867575; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVW2smjODfJ/QJ7oYRwkiJnVq1ZycVVGzSp1MXwc6KjATqpPcopoZRQz3KLbpNkmWX24zAyTYkYniS+apORNfI8X1gGsE7yjkGeaQpIyDF7oMrjXYk/xTfYwos+B3ioCohbW3wIUsV9YHDvUHzUBCtkbhax0ZfqX4aX4XBdEg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CH4Zibz3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CH4Zibz3"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061513d353so13185401fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867572; x=1739472372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=CH4Zibz3rE/F8+bMJiLzPz9S648Z2CCcv89XgbX1wwyiN6yPAERszqO6a5iBq7Z/D2
         cBdLYbFcA3laP1BPi8GqdgP4tKrvkBp0UlNaVBYUQKxKm+3FQ7kzyQ4I08q1+9wCffGq
         yX+CW3LVwHS/ifU6xvcAAHXEhpf9I3AFY4R7uLqnrHCHS++ZPjE5PXQWVztZjDGbJ6vV
         obSK705XFKPpSXCcq5DhCmaQ/Mchv21LOwNQDFmwO37qKgUGhjcFWyPcBSMcfARY1omi
         MzCVbXw/IUlFoMt+DvqHRiNTGPedgW9SrMeR4H7sR+8P/6+vezHA80xcbaORMqKpd9c2
         YC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867572; x=1739472372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=cwL8PYyBlDMKhBAhtZNnOka/ZEKXPkifyuIK3AZLFKjTswcvkJ2v7SLpnU5k19Xzux
         jrZg4lCq4GCpsCf6rgWJR117OHucx0KzeJg2kdSbQnZtOKGzkZEhC58yA0yr6y3AzMvs
         +hYFGqDavc+3vlhYVaObbpGAgbwW5PD1PdJt0amFg8DaQQzzQNznBSKVdcOL4k1UmsWo
         iLRsMJ2w1ShIogfuLSpvRuVXhE/N2j3FMIqTBF9KwzkvxtbdDSXUdlNtGch10Oy+2qTq
         cQd/Se2G7IwF07fNqrKaqccAuN4VKa4Jm3dq/JXQVU85esdINN1suQMDHdJXd0qSRzPv
         mCog==
X-Forwarded-Encrypted: i=1; AJvYcCW6N7N7F9/ChsQ+Py0/O09mglGpXjBSMRAjmJ5NA/9onjIdofqBqtOdYrX4R/z4IlgOBUOE3P+NR7fTFiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjczHBZDqF6sa380Ve+/0vGor73jn48MG9xeSdJNB38umN38hF
	F7sS1EsDUJuMcKvmW35Ub4y1pNEXud0+bUdJcXhNyl091bPz1VUKqdgR/2coeVaAMOk/oJHrBht
	/NHStAmLpHL9sV/vM1AYc7jYqIPwwxnXTAjJD6w==
X-Gm-Gg: ASbGncu0mZLdup8yRpnBsLQnerS9gUqGhEp3sktEQ8741wN3NdjLSnUC+GOLUcnmkt3
	szzcRPeQbNzXVPDh0woBY0iV9UNiSCNDKYdu52MM45g0LPgRKdT5Fucro5wjxwCLAw3IzMZo=
X-Google-Smtp-Source: AGHT+IHBXbEvo18HjmPufvQO4GaXJoRqBewEyheRHSK0Q9zbSI8UBYUsHoznNfcnvv1UkIJfoaGthv9VJSF8FinRDdA=
X-Received: by 2002:a05:651c:150c:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-307e57bfe60mr399971fa.2.1738867572121; Thu, 06 Feb 2025
 10:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-7-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-7-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:01 +0100
X-Gm-Features: AWEUYZk4bNNQBgH3TVFhlaeZ56ai3rTQMhsJjvQoZClT9barbrFQxRtMdamD3iI
Message-ID: <CACRpkdbDOH4gRcJFLeqhg1Aj3BR_SC0_1Odbi4vs-Oi70rTZ9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] pinctrl: cherryview: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
