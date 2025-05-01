Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6282254850;
	Thu,  1 May 2025 05:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746076326; cv=none; b=XXMDqz/UIiS9tfTBo6Rsmrrkrli/S9OxYXJgD8W4cGG+8gYnRpoxgz+7YWu/Rnm6exCcDlFUuMRCF1WONZUscbMHBE+rdm24DTFDW6T0Lca9ahv7ODsUrULsEDvFuUB3aeeYCsHMXqJu4vJw1Qr+EsjPny7tJ4tIXStSXp+NwR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746076326; c=relaxed/simple;
	bh=y+e4LNh0a+mZT7KuvkuNN9QKvyqkFkWCWi3RGovQ0vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7BNBWK/ybWUDlvJpC29hSe7R6CXIMB/xT+dF/bDVc+87ugyG4bC4k3B9wP7txkCCxbx+46qHIL7g7SMU03QZUuCbFnOdHg887lrTylDy8b/+1ug+pJKfSqlUs3cAZAMkBGbKJicUbwvhmvuHFOCRL9vrlFcEXqfx0ugTZS/tJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499c5d9691so696123e87.2;
        Wed, 30 Apr 2025 22:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746076321; x=1746681121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajprlg+s4993P4LGMO5ZNBmeiTXr19klHoz0G+I0WL0=;
        b=Xs6a/sHYCLt1eEDiNm70dqmOH1OF5N+pdokgK+IVj5jORJ0M5gzQUkBtEna9QNo6bi
         V8EDR1RjEBL+w7cl40zYt+bEMGD6cbs59RW/k8kPaeoCuPqgDh2it+0jduaFOYiJvOam
         C2+5LLiB4boB8bMgXLyAy41Ekw0CgERm9G2cVuwnx8jaWXXXvh5MmanpFGPXcMcK3WJJ
         HdpgQftP1n156iTAdKWPF48csxk1vl7pVJqaUfF/Vgloiw50I06na45WC+JiUtWYRym9
         iwhRyktBExu4UxqaPHCEBtc3FbBGfWEnsw0OsE4KnnUawbb4WtITRuzjAyCtc/8Ddodo
         1b7g==
X-Forwarded-Encrypted: i=1; AJvYcCVsmJyAf5IXit6sxz85rPyXxUnkfZDefvZiwuHFG1uJjptld+syqejTzAy+eIZQqoDGjAvcVcBzS1w=@vger.kernel.org, AJvYcCXcr6UFPN2rA1AWTORfGFDCnsyqvepYugwMjb9uNetGVXjxZYFAq8aBZraajjYCHSDbeguD39kUQlRny68b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0rECCE2aEvqiugd/qi9b0dwlTzq5BzNauSwPjyHEvrKduf9Z
	/xEixUwWpOE3JiBua9ZXaVrJ91HHZ5681XOB2/H71lGrrOdxGMzo2PIApOJb
X-Gm-Gg: ASbGnct+5A9JEXUvPVoBjOuOEsvQBTdY0fTv7Mcc8IiHfKcAMpDyi7WcJLxXPDiYUSW
	a+C4MneM3VGrrzUCm7Tpayyhwac01Hmz6d4BY/ABfakltIVsASp4ZsvqczrYsMXFq42Y/oAxQXB
	Ug4YB8qnT7p4YlIZ1wDS2hMaFOyCLKqjQqD+ug/oHHbfxS9ZyCOR6PnuXUyElnf6P8Gnem+QVRv
	dCLtLcS8P3IzsjhQp9oAsjFZ9sXlzTZoZEkcZL3P8c7+6B/2qGkxM6MlBbhq+NEBK0mvIWMS0lM
	YNnnEnDIbHYeq532cniUIHldU1GfkxOEhD4Rtakb8BtksN/+1rHzfU6eQXKGgkbLf0CpHxEJDw=
	=
X-Google-Smtp-Source: AGHT+IHQpf/txFEjzIrYixAnzD5ArltZhszSSQYM6RvveV/aco54vqUOtGIlB0Jq0FQoo6DrpGvnAQ==
X-Received: by 2002:a05:6512:ac2:b0:549:5b54:2c5b with SMTP id 2adb3069b0e04-54ea726d028mr354168e87.24.1746076320405;
        Wed, 30 Apr 2025 22:12:00 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea7647defsm92553e87.214.2025.04.30.22.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 22:11:59 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso4943361fa.0;
        Wed, 30 Apr 2025 22:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW22NvpDnfFZBNgz93GXEROb/P6XavKL+UiNUwpRNB/oB5cH+eWoikTcIhgNpnZhE/suzPXjfMPT7k=@vger.kernel.org, AJvYcCX+4kpB1Ka7uOHW+VFomJaE7Gd+zf6PDUxIZkZ8NoZHv1r43Io/VLbFfuXLqZk9KHZHczw83tPTUHyBPeNS@vger.kernel.org
X-Received: by 2002:a2e:a902:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-31f950cc7admr4279341fa.31.1746076319318; Wed, 30 Apr 2025
 22:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 13:11:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
X-Gm-Features: ATxdqUHTuNPlh61n7f8lB4pnNO-UYTl-k-uXFS9Jz53D2xoCXFTQKPt4GQyFAJU
Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:53=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the orde=
r
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>
> This just didn't end up in a desaster yet because most users ended up

                               ^ typo?

Will fix when applying.

ChenYu

> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.=
h
> index b35aeec70484d..8fc7fdb7ef494 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -109,8 +109,7 @@ struct ccu_mp {
>                                              _mshift, _mwidth,          \
>                                              _pshift, _pwidth,          \
>                                              _muxshift, _muxwidth,      \
> -                                            _gate, _features,          \
> -                                            _flags)                    \
> +                                            _gate, _flags, _features)  \
>         struct ccu_mp _struct =3D {                                      =
 \
>                 .enable =3D _gate,                                       =
 \
>                 .m      =3D _SUNXI_CCU_DIV(_mshift, _mwidth),            =
 \
> --
> 2.25.1
>
>
