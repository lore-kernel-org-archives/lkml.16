Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D8A139B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795089; cv=none; b=f+oHLpBfMz1zMVF8njIDBIFAcdG5r6DF1RZ2pbt+iQKicgQFpYExBXbVjwyLye+nhCXQuKFqhE6+IPCAi2IdA+E5Iqq0sUdJ+tLW6/YHZ9J92wseRiROsZUyrLqxW3AelzMxFXgU1szxX3Q93ihoZIImNOzqY9AXcmJyUU3kKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795089; c=relaxed/simple;
	bh=UZeAUV7fB5FaZiLEzNlfbpYcJuL9EFaEDtC+23S5TmU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QsoA1MdjlR0jwJF42+oHGlMttkvVnIUQOYyHeLxdDlPywf14IdvRwa9EoUCSDMWZfyR+bpcgPC/yoDirXyV8t5rbwZ5/fEA0s5mcE6cFBmC/iDR73CtLXScOcRbYjAuLTDIgC4XivquRzitabeAd0DBD1W4DviNdEy9z51V07Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A8AFF5258A;
	Fri,  9 May 2025 12:12:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 1BE536000F;
	Fri,  9 May 2025 12:12:16 +0000 (UTC)
Message-ID: <6fca28e476396963581acf511999086b71d2ec4f.camel@perches.com>
Subject: Re: "scripts/get_maintainer.pl" - "Bad divisor in main::vcs_assign:
 0"
From: Joe Perches <joe@perches.com>
To: Nathan Royce <nroycea+kernel@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
Date: Fri, 09 May 2025 05:12:16 -0700
In-Reply-To: <CALaQ_hp+TAgH6TFOy_DB0YpRYiDKNYH7LSL4nf03c1XWbrHFxw@mail.gmail.com>
References: 
	<CALaQ_hp+TAgH6TFOy_DB0YpRYiDKNYH7LSL4nf03c1XWbrHFxw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 7jtzkfsyyiy6ikrb8yp7cwpimyc1ygfz
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 1BE536000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX195aQYGzUqy5B28nyXVAKAHC1Zr7+5Vh+c=
X-HE-Tag: 1746792736-151063
X-HE-Meta: U2FsdGVkX1/0W7D9H+609ySKCsiWDorF1HfqfH4DVVz3LxMpvG+X7LiigQIPCfwTv6Apcd4aweQfWRJYPCUSmGyl6bDLLMphpO97SgXzRye/pYQCnrc+s8mpZXR2l7Ouox9sRS2zhpfBxcsIgAuplMh7H5wI/Z2BgsjfLLOhuWWzGpYUyu63EnBJKXl1lcmsaefGEe3zCsRN2eZxpsS/fKPagkChpTZ1NPUCBkuhsYS19WoV3IrO+yUhoLoGyK8xytYTyZqKLD2j00tzDQCEOAGhsLPhYbygByDjZVs0tqXij+LbzfF16Hs06VQHO/92rIBjQOXFubz+Rtni1RA66Noh+z+AM0x6EbFDlz+GfndwIY2rdrMOwrpTVe9eZ6VozB8CA0laoudvEpILB7thJETQaxyaBCteCjOu45D/SA4=

On Fri, 2025-05-09 at 03:18 -0500, Nathan Royce wrote:
> Commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>=20
> The result from `./scripts/get_maintainer.pl -f scripts/config `.

Dunno

:linus current
-------------------------
$ git log --oneline -1
9c69f8884904 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'bcache=
fs-2025-05-08' of git://evilpiepirate.org/bcachefs
$ ./scripts/get_maintainer.pl -f scripts/config
Seyediman Seyedarab <imandevel@gmail.com> (commit_signer:1/1=3D100%,authore=
d:1/1=3D100%,added_lines:16/16=3D100%,removed_lines:10/10=3D100%)
Masahiro Yamada <masahiroy@kernel.org> (commit_signer:1/1=3D100%)
linux-kernel@vger.kernel.org (open list)
-------------------------

:linus at commit 0af2f6be1b4281385b618cb86ad946eded089ac8
-------------------------
$ git checkout 0af2f6be1b4281385b618cb86ad946eded089ac8
HEAD is now at 0af2f6be1b42 Linux 6.15-rc1
$ git log --oneline -1
0af2f6be1b42 (HEAD, tag: v6.15-rc1) Linux 6.15-rc1
$ ./scripts/get_maintainer.pl -f scripts/config
Seyediman Seyedarab <imandevel@gmail.com> (commit_signer:1/1=3D100%,authore=
d:1/1=3D100%,added_lines:16/16=3D100%,removed_lines:10/10=3D100%)
Masahiro Yamada <masahiroy@kernel.org> (commit_signer:1/1=3D100%)
linux-kernel@vger.kernel.org (open list)
-------------------------

:next
-------------------------
$ git log --oneline -1
ed61cb3d78d58 (HEAD, tag: next-20250509, origin/master, origin/HEAD) Add li=
nux-next specific files for 20250509
$ ./scripts/get_maintainer.pl -f scripts/config
Seyediman Seyedarab <imandevel@gmail.com> (commit_signer:1/1=3D100%,authore=
d:1/1=3D100%,added_lines:16/16=3D100%,removed_lines:10/10=3D100%)
Masahiro Yamada <masahiroy@kernel.org> (commit_signer:1/1=3D100%)
linux-kernel@vger.kernel.org (open list)
-------------------------

