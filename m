Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0581E5B76;
	Mon, 31 Mar 2025 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424187; cv=none; b=lRbTibMh7jcAnkJemY+bg/+v9W0Up+MghYiiaGSKrNU3Fr+sY/LsvvoQ7g9WD3zaW0/ttHPFypAyq096Eff7QLGdq6/Llk/zGRTAXWpY719ddKdt0GDjpQjr5LWSfX8rrw8IUpCVlk/K07ENL3bSjcbZR4X9XJHCjIZzvinaWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424187; c=relaxed/simple;
	bh=Q0uMus4E1XkPX9O5u3vzmN3QB+2Nx+b7VVilwTqYSGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Srbb6SPnavMdgDpSIEEjPoI5MUDLOZa+kqqFA2xkgA+0zIycWLl40HZM8d3xtQuulaufQDutrZdpEfw054Ukbk7YhHXnN7Ex0mDRxGyPtDL5FXmXHd/WZuZNBTPOI5UTU4bWTC2cJdO8WeXolMI8CBG4lFldVo3FnqFm1bVCtms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXo+cz57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXo+cz57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFC4C4CEE3;
	Mon, 31 Mar 2025 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743424187;
	bh=Q0uMus4E1XkPX9O5u3vzmN3QB+2Nx+b7VVilwTqYSGc=;
	h=From:To:Cc:Subject:Date:From;
	b=SXo+cz57pkOnm+kSCCxSUJBNpjoFROzKrb2V8ym7xf5lTrY3/3VRyVO6yti9WvZVL
	 7Qm/72sIzXYTzo4nPJ5Qlco1KHi+pZe18uE7SUqqEWW8/0LCuI4m76qK8jtajgj1QE
	 ahnajdygLEL2QT0eNZ5uA6yS+QS00gIF/j6rtWdp3h5uFd53AbIjvDcO43hEY8A8WM
	 W30qp/SMdUL9cvBwDEBB9t2Yqq+HpGjVHmV3hAXxTnmGZBmrk1ZiaTA2dQ3bHqk6+O
	 VNI5DGvuX8u778DD3SziBk+fzps3maDMmzq7q5YwBpCYAxA25r2fUwbq4ZaCKd4tOK
	 OXFZ0gSmHIfKg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.15 merge
Date: Mon, 31 Mar 2025 14:29:26 +0200
Message-ID: <20250331122926.607374-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

A small fix due to a typo during merge.

Since Andrei had already sent a fix for it, I am sending this as a PR in
case you prefer that, but of course please feel free to directly apply
it as a patch instead.

Thanks!

Cheers,
Miguel

The following changes since commit 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209:

  Merge tag 'rust-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2025-03-30 17:03:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-merge

for you to fetch changes up to c1f4534b213d7be41b5d8b815a42d201a8f2978f:

  scripts: generate_rust_analyzer: fix pin-init name in kernel deps (2025-03-31 10:50:54 +0200)

----------------------------------------------------------------
Rust fixes for v6.15 merge

Fix 'generate_rust_analyzer.py' due to typo during merge.

----------------------------------------------------------------
Andrei Lalaev (1):
      scripts: generate_rust_analyzer: fix pin-init name in kernel deps

 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
