Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE22E5403
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049059; cv=none; b=bPjXg80Ztj+NrkZOt+b79brJbrVCZuL2ufgYzL2wyNMyuoR+bLsHLjV564WqcQPurZcMH0IV8To7fnqli4MqM7lhEqXX7iw4Dkf2CaRJ9pjQm1xc1j69d5ZsagUOJ4mK/oTr0yR8zmhT1b7yWWJ/4VsLDRI4it3I3hRTFx1B8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049059; c=relaxed/simple;
	bh=Nqcgkt4bolyi3bRrcnw1aDyC9Y49w33J9TENijARpgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBMptp+6lt83czLZyUQdjufTYC7PL6BRxNvz9xHJY6QOi+DU2GfOBrsO/8Ja2GHVkz8Xzbnera88DqQxmwNO8EFAkW+WwlNP1Uo2ef2vFCBekoCyPKZTTAm9R+Ix6B489F986PKjRJk1Pq/oUTM0u6C+/cHvqE3FMG+qxPAGnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plgPosJm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plgPosJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130B6C4CEE3;
	Fri, 27 Jun 2025 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751049059;
	bh=Nqcgkt4bolyi3bRrcnw1aDyC9Y49w33J9TENijARpgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plgPosJmyNrihEruAuxGCovWsINyDoKANVz0XOMKin6rFfsUaVSni5gxpvz4m5LoH
	 5SIxGh/M5Jwkwu7vTPD5eNoVHxxlnmQhY2TQXJRM06mq1hHRyEna0m1L3Pn1QEQ6fT
	 hxDEkvFqLPrcwXHfzLRHoNTPUt190O9W51n/Pm8oVHZoQa+BvVCblFHoLqi1kh0F8i
	 Md38l/OqgeVdMTgzpblxzuLx2TDpT6VqOeFWN4P23AXyhxsI8cnk+YFwKr/fJ/1pvV
	 J5flClImwPyPm3LDAXIq5IK4VSxxXjpRem6/OdZiBVEcl+IJT/qBncrXUSJxq28vUq
	 mNc6vtJGLHw1Q==
From: SeongJae Park <sj@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	david@redhat.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: Re: [PATCH 2/3] proc: kpagecount: use snapshot_page()
Date: Fri, 27 Jun 2025 11:30:56 -0700
Message-Id: <20250627183056.52582-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Jun 2025 14:16:52 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

> Currently, the call to folio_precise_page_mapcount() from kpage_read()
> can race with a folio split. When the race happens we trigger a
> VM_BUG_ON_FOLIO() in folio_entire_mapcount() (see splat below).
> 
> This commit fixes this race by using snapshot_page() so that we
> retreive the folio mapcount using a folio snapshot.
[...]
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
