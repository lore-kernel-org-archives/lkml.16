Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC928312B;
	Wed, 18 Jun 2025 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238442; cv=none; b=qs5kphvZc4itYJXZw0YBtwTaIiPMXo9VOrwdJLVuQ0a2OY5xtabJg2I9GkQL67wlw+UlhDW+QG32yiYQlG88kmM1EQbYNfY10hMl6ocY97r19RuIWW++Ht8wriwkalH5Yshkcp5w3uPwDkRbV68+PAXhwpBs0rt0aHRkCy2aYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238442; c=relaxed/simple;
	bh=UvazFRWtsQVcroH2hueaNN5Dpks1a0vU9l/0JVLr5w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBximeP0b4cVmIpKOZucHFwOKMf17DAeecelsTzWK1hW8k393JXtqOMx/pIEAlf+7+q+qwrgRSLoes3URFTx0wzK00p/PQyveme7cKxWYF2fZ6HZjdFuj8NdUgLe7Dbxsr1+ScG4MEFPJYFinc4Ao3dquHMB5gtFv95pxhLdabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGVunDWd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGVunDWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985FFC4CEE7;
	Wed, 18 Jun 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750238442;
	bh=UvazFRWtsQVcroH2hueaNN5Dpks1a0vU9l/0JVLr5w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lGVunDWdjtzBKeTrfku7CTTBS3GQTVXegKgvRMVkWJJc0OyU/kgpouOmnLQvWjrpO
	 gnlfLhTUWweoLR7umNl1QlOXhaIF6+EWylg+BzL4+X3+Q5x1iMMtCfIbudUSVkiR9Y
	 ltzNJ903/kefKIqyO/lUOqW/KKqIwFaCeB4LNShjnfNR1qwvGTSxAFJrB0WPqfeYJx
	 DCKR4BJE8qdh94uH9V9GCroIoecryh7JwOq8YRvsqSQiUHjdBcuruf7PEr6kGfCLl7
	 DvUX0D1avMKR4ldBIv9qb7+IrajVSFuuZrixPj4on2GvFWztucIfmf9Kf6QStHpWom
	 W4LUQJjrsDEFg==
From: Christian Brauner <brauner@kernel.org>
To: RubenKelevra <rubenkelevra@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] fs_context: fix parameter name in infofc() macro
Date: Wed, 18 Jun 2025 11:20:31 +0200
Message-ID: <20250618-chirurgisch-heckklappe-eb658a60fa1d@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617230927.1790401-1-rubenkelevra@gmail.com>
References: <20250617230927.1790401-1-rubenkelevra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=brauner@kernel.org; h=from:subject:message-id; bh=UvazFRWtsQVcroH2hueaNN5Dpks1a0vU9l/0JVLr5w4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQEtTx9u/ake2Bvy4Utxx7eLA6MTb6st4+3KkY+s+bc/ oMcuWnGHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPxmMzIcLIxdU/JpZhfTL5K pk0nyhlFlKYHHpp4YvW/17baO6Yl9jMy/G7hEcnW8f1z/+LrJ3mz9+/efqJT99LC33eVVsQka87 fzgQA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 01:09:27 +0200, RubenKelevra wrote:
> The macro takes a parameter called "p" but references "fc" internally.
> This happens to compile as long as callers pass a variable named fc,
> but breaks otherwise. Rename the first parameter to “fc” to match the
> usage and to be consistent with warnfc() / errorfc().
> 
> 

Applied to the vfs-6.17.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.misc

[1/1] fs_context: fix parameter name in infofc() macro
      https://git.kernel.org/vfs/vfs/c/ffaf1bf3737f
