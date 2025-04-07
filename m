Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED779CF;
	Mon,  7 Apr 2025 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001500; cv=none; b=iwSWMlYhiPE180E+j/Wg49E7opktvT51LIAgLjRpLgx/LhZQGvb35iya4oWO0mtdGqBQ91/18n1ZmnIOLuFpT7Q2kGKDBV3mf03DQgBpk3VVhZJ/J8xLMxr36jn+AUbdo/EiLvdMwVvQp7Mwcg4+LgyqHbnTEVI0Cwb4E5W8k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001500; c=relaxed/simple;
	bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hX2+4FdhcICAKIZ/AaxFc8qi8QXxnIA6uzbrjjmwZJSEK+gwMlY4x+xN9sSVOOZFzhA+VE1fYd29k9K/tibx0gjFyl5yz4xmh++NTf8RwFn2/N6YHOpT8BLdWV+186/SraJM27HSJA0iKmKbXQVKIPsKFu3l39SH9OoAKIVvqc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf1d48843so34545021fa.2;
        Sun, 06 Apr 2025 21:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001495; x=1744606295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=;
        b=exmfPzGFSqaWXqamIb4ee7zwzsTBp+XauH3nIhYU7laI81xPGMa/wUr/zCFB5bgB5r
         3gObu66XD3wiJNlZUA+o9v4E3MitzdTqe2VLlo/qWF56pGJwfa6yTN2/8EZ9Gv47r23v
         aZ0Goe1O5rPDeqnVsMOqrh1YtexBLOdVrNVKWxO4d1eQBjdq0UdFVDeEh4Amv8UJOBhT
         /YCfLD8OmS5NdvwjvJrbvKMutgQsS9mFtNNKZAUnfJ4lWXBtBbFqlOK3w/YOXJz0pWLK
         xDCIEohd+Miq5K7CxQLBdSw8iN8iHphKgDQqoLZcMgXEtLmWskhqb6NYQkQLPkpn9DUX
         UQRg==
X-Forwarded-Encrypted: i=1; AJvYcCWUdmI2+58IiXHyeXqP4sILrDxP6Uo7LqijtrN/UsZqaX784iVRQ/wY4V7VLmBrM7TZ3XeUuxL6voEKgj8=@vger.kernel.org, AJvYcCWyVjq+AGqhYlw14R60sFH0cO7WleOJfsvRrK3//Hh9pbsneZ0olnP7YaSwwKQY2YMA2U34heAS09Y87fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5oekuk3CGOQzIMR0gGb4kIDKv2rBo1xTmwkh5AXCjZu5Bh0U7
	5beewp4QF5coYy1kpSDMCt7Ccw3yX0DqdxfKf/oc+AZllU4CJ6t6ItTAr504y1g=
X-Gm-Gg: ASbGncv4NILyI8LlKx6Xm4Wv6miK98TphutqRUvXIClwBmuuaePzyNldxIXlgPcODQ/
	VA4qNnXzstqYS7DzgPaUS0KT7KCgMoNHN3IOZm1O8ynnSDttzijc5wUtH+m4qD+jVbaeCZD7FDp
	Z6D9o4IoLJ4rEusbSdf5bRHvZmpYCwvHZk/jh1OHhivvQ4OET/PmHF7klzdtkfIN07uyIiZpAEg
	LmDydd0H1R/8jeNqDHHaz1oIjFmpHl+r7jpZFWskKTzEz+VNgaKYQe+cKmstOv+4zvWmLU54Vkt
	uHwEzBVjztRn0RZ4Oa+/FCbiJw9fxrtBpicVdX0/P2g80fcGasJyKIyvCbkRk/iRpZWhiCARbG8
	tusfdMu94
X-Google-Smtp-Source: AGHT+IGWlwv4QnXDpdeswMA4rHCcQHzD32wORTcYOaN6F1muqB3ZGZdW7nWVxZgwHOwQiDlgq/eJag==
X-Received: by 2002:a05:651c:511:b0:30b:acad:d5ce with SMTP id 38308e7fff4ca-30f0bf4df48mr34309001fa.21.1744001495374;
        Sun, 06 Apr 2025 21:51:35 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312458fsm15129961fa.21.2025.04.06.21.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 21:51:34 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso4751529e87.0;
        Sun, 06 Apr 2025 21:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZSA5ERjKOt7PKJ0QIpKOf6/jkpaW+S+53sSRiixXloiyc5hQIhunbevqAdqwAEFXoREe5cI3XpqbcfzA=@vger.kernel.org, AJvYcCUo6l0sntQo8y49er70Z4rtoInlpiWBNTecHCRdmPC/MRggB/U58cLfEXTVBYkVPOkzy+/6Z7m8HcmETb4=@vger.kernel.org
X-Received: by 2002:a05:6512:23a9:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-54c232de7c0mr3438632e87.16.1744001494072; Sun, 06 Apr 2025
 21:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325092640.996802-1-nichen@iscas.ac.cn>
In-Reply-To: <20250325092640.996802-1-nichen@iscas.ac.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Apr 2025 12:51:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
X-Gm-Features: ATxdqUEZG7Odd0SifC_ricgYeL5KuO6wOUwtgabtbNsFOdLz6S_zfFbrTXMlBZE
Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, ckeepax@opensource.cirrus.com, 
	u.kleine-koenig@baylibre.com, megi@xff.cz, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 5:28=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
