Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7C28C01F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618579; cv=none; b=L8cku79K9YJxKIBgXkqINngJthxuq1KLZ25+1pZLKmTNxBKFCe1U/42qZFZvqG1xw+M0K7DBSQJxXmke10oqsCbiBzWoCtZHqmvuxzU0Vg4JK/4adcC2HHdzTt/ZWsJ9PSYTuMPucEwnG05D4VKnhRwz2TTQdnPisT4AbHOQVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618579; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKynz8pEuJWEJsldgAn22sPN1QiJMop2YhC9a6SVDOqUMAXFB1qruvFfAA3/vw+vwxrdUtuvh4wK5+vvfcUxrLQQ47kLh3ilCttBd1BxRFtO7HeIupwHKC+8cmmiDg6vcdImrZTr0pFEJzYFDFI6lCIywj+nwXVvukfei6FQG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNq7MvdZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNq7MvdZ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso860526e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618575; x=1752223375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=bNq7MvdZBIJd8CTDAwciPST2c8+4Vyr9bEq3GuEPm6tbBd4FdaQ6Ye2NbTBPblO8Ft
         K7trkzOAHCqDvvyqOxMcWbgmeOqsWBGxCAUHQz2pnwIy245tegVxYQ1YNGOwWEkZdsvW
         LgJlKQDjDskrLrdBc7TTelcKv0M38wLEsgiyyKSIDm7FlDje6hElfFDWGxGPAvLP/MVc
         W8G+ZLtB+bBJYt/Eon3AgOcJSG2vkR2MaT9kN3F0/IwuhTatYKqQ/5OYZZB/lCwJO8jM
         AwEp/GwvbTH95/+DRCYi+yNNLPF/4G6fya4Cx2VFOMu1n56aU+jXDs1E5rBKz1oEvCJm
         uLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618575; x=1752223375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=PzuWQC2ZSHHOfe375TNVEawQdeUP/zJm1KXUzQeoeCvtqTizcrI0k2QJx4P+bjk195
         pw1Kq4UUHraTx0rUtxCbNYiDkR/0RY6D1eOJqZID+7yLfdialS61kh7u1XW3MGe1cMS/
         lDTA0CxwlNLa6jbfBFEvzuIa7u9nmMtva9TOm9uv/Iea/VJ+L3nb4usAza6YjC8zfzA4
         rhQPALDjn4sY5DansvxZeKyuInDJiN4d7mi6TKj5konwXor9cgLV9D4r1iuRokLptc09
         ykOeIo8Tk/avBOGkwO7ggLJwAZGopvOfbe97eYHpndICQy/kbB3WPJBSmtODShcVlTg9
         ZHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCyvIlqlSVUfAV82CJ4esVB9Y0Zc9xOjvpvGFVO5WsXK1uUJ500qoegwntgKRTe3IDjF7SOeqhzCXIms0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxbLxzTpWALRfLpUpQ6XnMcCf7d4Ae3+aLJdJD/wEYNqz9g6E0
	gS7fwhDLP4n7ZJJA5CB+R1496QbQbwhpol047yiwXsY0t1KR7J88h6LQDlHfbfcESXrsYplNGDb
	qT+H0Yy2XH8Mn2R2p762TIGpIONizDhNHUTAr42T0zw==
X-Gm-Gg: ASbGnctzIEgZkOdi+ERzKpRLq34qPb9mvJhhSdcSfnmIZhbMEd9PjGfGIaq+knNtN4D
	rpSwfxL6z2B7mUGkjgP1TpqmREAYwFN1upLOyodqgRW3zJdwt37n9tVOtBlud3vPKYnvJXFYK30
	HBIfdIlWXBWMvt41fHPyJtn6BKpgadMdslWz+FP3vuM1s=
X-Google-Smtp-Source: AGHT+IGodMjqDkDesQdG4Hjakhr0TOM9xUbyJgILsRTpZGqTHkPFTfySztIXo8nEvUZyWt2JWT7aRKctMeet0pwrsBw=
X-Received: by 2002:a05:6512:3e1b:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-556e684bda8mr524787e87.45.1751618574621; Fri, 04 Jul 2025
 01:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:43 +0200
X-Gm-Features: Ac12FXznXJQ0ImElx8AS_65o16qEpHJnw8V0OHvMEe3Y5zyTtUuH2rGO4fQjXsY
Message-ID: <CACRpkdb8Z3oLwmB26q1xdHMwa2xTm1sz5g8_a0BHMK8oHsiF1g@mail.gmail.com>
Subject: Re: [PATCH 28/80] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Stephan <jstephan@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
