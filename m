Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12198265CDF;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=L8DtobDPS4oDUjM4shNgd2yH4a2nkNmp3egjbBbpYAugPe0I+xqlh9Aj6/nNbrpBnU/hISBSP317txcyjUhxUJ0YSzErGFmYgZfjE4n81EEild0Ku93VlJ2IuAcH6HKhbpPMKnP5sxRCgjgJk2Bq9CPLh4aYtJyxMVl84ElbX8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=2u3SyFsxIXspNw8e+0pUv6hD908nVrF6VatMyj0SdQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhhcNMmjhy4aNe560lprJU2UJOat/DUPU44AV8THiaL1OTrIRDhfm8iq0vgf+61AHWWgNKeqv1IXSWKGkXbayjXceyz+2X3d3qNWOthTY2fuhn6sMi4HDahaDglASiohNfmkgRFa250oyOov8TYG+NNSwm4zRN3hNTJMwL2R4o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUiFv+Hy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUiFv+Hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DABEC4CEEB;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=2u3SyFsxIXspNw8e+0pUv6hD908nVrF6VatMyj0SdQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUiFv+HyfWajSYhQZpi0USVDbgCrVfyfaKoE/oV+xIZMSd9VsdW9jQqHKd+0H9kff
	 OWEr5CLEWmTNUbAzGBaBn5F5aLsyQgaDznCSBsBED1D++n3Laf2D183t72by0hxi8w
	 l4KF7rsQbd7yF5mfxowT2PSyIjSL2UtG3y372KIdq8IssCRKzGmHQoStd/HoV3sib9
	 W1jDx1mhkWptpgr3UTICdzQTo1fbgCiPFj2uA5eHSQKJQjnBR7We1XNe8EXsLJBcJE
	 S7MTMl/refKAVZ06MdJI7FXMI8MaZcWFfSMLFS5JpVtk5a+ukY0Etb9mS4K5SEkf6c
	 FtE6eAx7X23jQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25ts-00000008RVI-3uUZ;
	Tue, 08 Apr 2025 18:09:48 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/33] scripts/kernel-doc: rename it to scripts/kernel-doc.pl
Date: Tue,  8 Apr 2025 18:09:04 +0800
Message-ID: <a8a86136bcf102495f09c24a65817f1600fae0e8.1744106241.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

In preparation for deprecating scripts/kernel-doc in favor of a
new version written in Perl, rename it to scripts/kernel-doc.pl.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/{kernel-doc => kernel-doc.pl} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{kernel-doc => kernel-doc.pl} (100%)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc.pl
similarity index 100%
rename from scripts/kernel-doc
rename to scripts/kernel-doc.pl
-- 
2.49.0

