Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68F24633C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578221; cv=none; b=s2ltWzCfugL8XCjj5/wrkmFLg1gK2JQ/sjBS6qNSrgQwkuFgFLo4X697DTab4mPIoqg6M4/9NoKDdvTdHaJSyYb/M2gcUqkojzQ1+2Re5E7sehWrArlXVjpc8ZNDF+cX+2XMDlHayej3GYcrCMG82NRExttBxHhs00ZOHV2CBlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578221; c=relaxed/simple;
	bh=o/EIqDhRHXNwC661Ix/Xh07w858mX3cfWZTrFQXedL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMOBfbFaR3/VPuBvDwb+et6ZRhCJyB/PJiFOhaOPWDPYn5DEC38RzqeP935MdGJYdjpY7lfsJq8WzrEc8gNkeVEP+EwhRRY8kJ0Kxxx4jloT/elORgU7OyWW+KPvIEjo7FWEJE6ljtHDLNu2heWg05CjcWRRHS9uSE7pw6IOFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8lA2SJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8lA2SJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2EDC4CEF2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749578220;
	bh=o/EIqDhRHXNwC661Ix/Xh07w858mX3cfWZTrFQXedL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C8lA2SJeEYhikdL+aZZWnFPTO8dh+r7awAOO0N6zOr2Y1JSszkaghSQ6g2jc5TsaG
	 bRXjG/WJwjW0YgCzD3fRLjSraJN88Ih3AccAMiAZBJaEJv/Tet940P0Zpfr9z6IfF6
	 V/Eq4N++eRmnwMXWi00mtB26HFk8wESbAHZW8OrJJ3qB1v+q+mRZf+sksu7fZs4tgU
	 UgXblbBx+nSd3/lvIqxkuou2Crr7jJXZj4mQU0X6Oda4F5TWhQ5PSbCuVzGUCLTDak
	 7+bSybB1XsAGTbVZ7vgXLQlqm7A0Bm26swXpbKEzIXYlitePywArEXCCk53Pvh1GJD
	 qzebgfYrFh2JA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60779962c00so5622336a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:57:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK1/lSWLxIBvsuhXFDS+9cze+mKP0XSzBQVGPGg7/UCfZwnvgAVvyLKS3WP8FEeOBgk2Jeon3xufwMnbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdeQoPYAHw17aiNNoHwodH7edfNmYEibGwHW2Oz0Y7MZugSqv
	vwEHsLvLutk+B+tn6ucxix88QFvkTPMI+Hn6Vnn5xC1adTXiZ7ozO0kUUfDHiB6dDabTaMnMd8Z
	vb3rzJJEOSXlJJmm0tpnX/sxVX1vF0lncgsQp7yJ0
X-Google-Smtp-Source: AGHT+IGZXUq7dF0vWaS7EQJBO5eVjQ/62SvrC56EQBE7WguprI9Qv3UDt+jKNg2wBvmdSxFLEb1PFEKm0hwONKUXytE=
X-Received: by 2002:a05:6402:d0d:b0:604:bb1d:938d with SMTP id
 4fb4d7f45d1cf-60846d30b2dmr95190a12.34.1749578219228; Tue, 10 Jun 2025
 10:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610175442.2138504-1-stfomichev@gmail.com>
In-Reply-To: <20250610175442.2138504-1-stfomichev@gmail.com>
From: KP Singh <kpsingh@kernel.org>
Date: Tue, 10 Jun 2025 19:56:48 +0200
X-Gmail-Original-Message-ID: <CACYkzJ6Y+wcBeVgU-SbxFbimQQ5ve3p3J1YEAcb=VhPJwaYFvA@mail.gmail.com>
X-Gm-Features: AX0GCFugYv_WEc-J17kTVrbFElExKOsgJjQw9bwraM1ZC-OWcx0MedIOHxHss0E
Message-ID: <CACYkzJ6Y+wcBeVgU-SbxFbimQQ5ve3p3J1YEAcb=VhPJwaYFvA@mail.gmail.com>
Subject: Re: [PATCH bpf] MAINTAINERS: add myself as bpf networking reviewer
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, haoluo@google.com, 
	jolsa@kernel.org, akpm@linux-foundation.org, lumag@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:54=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> I've been focusing on networking BPF bits lately, add myself as a
> reviewer.
>
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>

Acked-by: KP Singh <kpsingh@kernel.org>
