Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1F21A454;
	Thu,  5 Jun 2025 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152373; cv=none; b=XVsJJ0cwI59scpYsf7Sgt3YKxLjssg5prZlW8WvVt8VBfJ+Rq0VVFbBC9V54t0EkywqWRQMainNG9fS12T9xWadxX4dDoN6uFkkkaICyr0z8nZ91cA9XohgV/zC0U9sXNEvGWc13avVca8cLbHlLf9dIIooDPD7P5QpKCE1vlOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152373; c=relaxed/simple;
	bh=8kX+0SKha7Pws3nxTa2q2GKi8InvsonHOdQzOKyIg5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soxTOE9GaW4JShrn3EGQOq9SsBIfUpN4CQ8ex9QTcT9wgc5qr9R1l5JcYGO8+tezoqTcv7bLxtT3LUfHzqyUlNxTFumNQm1vylqKgY66RKi6QiN3AbtM/W1YcGI6OQRdM6IUjkGHVG0BStNmqjbYnDA3KtyYeRLgOdr+9NTT37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNoFza2W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNoFza2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27446C4CEF1;
	Thu,  5 Jun 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749152373;
	bh=8kX+0SKha7Pws3nxTa2q2GKi8InvsonHOdQzOKyIg5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sNoFza2WKsj59ZBl3LyAwyuvCSQonfD4ecSrSv0VaXOY3dzUibhwa9zE6zg+LxxD/
	 YSVMpXnm1l5h5te334aTFJAQ7jaM7ToibyjLWWUnG5LgEx+m38qsLI4Yh8c3VpnnCv
	 zmsAO09bjS4Cgblt10mOjAnsP7X+AHhCEoAVcpi666fiHyXtTE/A4GzDZvmeg0Tpwv
	 rBQA2qs17HVBPcC1HcnhjfHmKCDNRV3d+Vxzbf+PREf80nh5WNTMs5rtAmJW+KmqNg
	 T23MyVltYfjCZXQ5cBoFuBAv5BsUamckLeMahq3m+a5eHL6Zl7nxZMjhH3RbYoUnOD
	 HEJ16LRabBrKw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5534edc6493so1651154e87.1;
        Thu, 05 Jun 2025 12:39:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBbUEEWqRF1EILN2Rj/dIEqO7gvdSRtdydfU2/7z8VvFyA32XpKTV4c0TqP34zJjkmvgjns7Vf0sJtk+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1JnKVBO/GA1oeYxLImc7GO9vctV93+NQujCb7BPXuqNHG1paY
	8gcMmp+EF1r/w4PqTym81AW3Ynmv0T1ARaQMeHDNn5YVcyiXl/zvK/YchhBeR/AAfrD/m3fnA/I
	ZMIl3zj/0w/fIekuY+yFMCbt3TpAYRRs=
X-Google-Smtp-Source: AGHT+IGsSiZ3bAmB/88G8wDxNMfEjert3Zql/M99zaJiTWefbqY+2uUyuySefy7f1WLQwJ6fWz5vkqNRoTpjEeyfoFY=
X-Received: by 2002:ac2:53ac:0:b0:553:20f2:2e77 with SMTP id
 2adb3069b0e04-55366e33a1emr80046e87.55.1749152371856; Thu, 05 Jun 2025
 12:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com> <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
In-Reply-To: <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 04:38:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8ie2VmJ2RiMZaV4MaHi=hGebev7LV+jpD2cNt430aQQ@mail.gmail.com>
X-Gm-Features: AX0GCFuFmrxL8miWi2wty8frgs2Oth1qCIdZqsrJMDUMEj9DGCIH_tEVwPEpd4k
Message-ID: <CAK7LNAR8ie2VmJ2RiMZaV4MaHi=hGebev7LV+jpD2cNt430aQQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: symbol-namespaces: fix reST warning with literal block
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Cc: linux-doc@vger.kernel.org, willy@infradead.org, 
	linux-kernel-mentees@lists.linux.dev, shuah@kernel.org, corbet@lwn.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 6:10=E2=80=AFAM Khaled Elnaggar
<khaledelnaggarlinux@gmail.com> wrote:
>
> Use a literal block for the EXPORT_SYMBOL_GPL_FOR_MODULES() example to
> avoid a Docutils warning about unmatched '*'. This ensures correct render=
ing
> and keeps the source readable.
>
> Warning:
> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis=
 start-string without end-string. [docutils]
>
> Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
> ---
>
> Changes in v2:
> - Use 'For example::' to create a literal block, suggested by Matthew Wil=
cox.
>
> --



Applied to linux-kbuild.
Thanks.

--=20
Best Regards
Masahiro Yamada
