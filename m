Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E643159
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751728538; cv=none; b=qxStKGmQR7TvBy7wV8qjp+KuT52R7GIKDJfF2pxn5kvRWzXLiZqt9TsoUU+Kv4TyURpqWCKlDgyHSin/Y6sx1fbE0sxg9kfwCeRxq/Tbx7PSojphTPdfDEo485/8mkMt7JJLgOW5j2G6A3yZ6/jNU/UBOg5JOMuRsNem3GnwU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751728538; c=relaxed/simple;
	bh=hjrcl62bVAtqXxfz6+YFsw9u2KuCe9nnoZCDeiHxWwA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fYJVqWDQBaXTgeZyoosu3Aq1sOjt6rXOvv4fMZahU3d7G0e7+QBKP/zxRy6PP9/szO5NiZ1/VgYtDhB5ePBJSFSUHgXfh3rAUCNLq/xsdo+Qu4VFAfcqJ04C1jO05UuqByAik9JjkkIhyBq0KNYFlisK/o5M8HNprqQiDjotFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruuavuJV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruuavuJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99489C4CEE7;
	Sat,  5 Jul 2025 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751728535;
	bh=hjrcl62bVAtqXxfz6+YFsw9u2KuCe9nnoZCDeiHxWwA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ruuavuJVWkLPtdNyF2hgeDlAuRylaWBaoqCIK2W/I14P8256mDSFxKj5qeOoExAMt
	 oa+kp1iMOnVs2kDDaZir1vdeRQLeB1+t8mRLWbAqVOd6Vd3eGV2r3godSnl+9p0gj7
	 cTJrgVj20cqK6TN79SJV+QM35HFsdkWZfpK5l/Xr/rh0vF19NsE9nTVcYy9bpFuIkS
	 IRtRhZeUuFG1j0y4KSRKysBmoZz9xAJB/iGBJIKo22PwAAzzqfh/9fMMNaJ6EQeBqs
	 dOo8UzCnhe9EvEscKSIsHOSuBNTy9q0jKDy26VFLDl8aMfURq6K1oXg/St4bFcMAEv
	 IHe0+Ku9QNGWw==
Date: Sat, 05 Jul 2025 08:14:33 -0700
From: Kees Cook <kees@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
CC: Oleg Nesterov <oleg@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_23/23=5D_binfmt=5Felf=3A_Warn_on_?=
 =?US-ASCII?Q?missing_or_suspicious_regset_note_names?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250701135616.29630-24-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com> <20250701135616.29630-24-Dave.Martin@arm.com>
Message-ID: <D620FCC4-4A72-45CB-AF16-456E2B49B5C8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On July 1, 2025 6:56:16 AM PDT, Dave Martin <Dave=2EMartin@arm=2Ecom> wrot=
e:
>Un-migrated arches will trigger WARNs with this patch applied, and
>arches that don't specify codedump note names will always get
>"LINUX" -- since the whole point is to stop guessing the note name in
>the core code=2E
>
>On _unpatched_ arches (only) this is a potential ABI break for the
>NT_PRFPREG note (which, for historical reasons, is a "CORE" note even
>though it is OS-specific on most or all arches)=2E

After all your arch patches, aren't all the archs using the correct values=
? Is the WARN for new or out-of-tree archs?

-Kees

--=20
Kees Cook
