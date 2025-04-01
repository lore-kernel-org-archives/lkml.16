Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399D1EFFB9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510562; cv=none; b=j3OtLIZVx8njoDwDNRUyjifnrvxT/jy7/F2gddg9mESk58MG2xJ2QVg6d9bJ9eg4+/JE1CcnRaz4mnG3Pk9DimGBWiQUY2zFgmd17OOHoHaRFxBojCSwPzW5iobh3iNrEh8OfmlzvdlkF3Xwa+QoTnRvyGkK6Pwm6SXEKXLeVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510562; c=relaxed/simple;
	bh=RI/IHYKkeya9qVdcSpSUQZLdmcW3PHEk+IkiV0Smdx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXZMbL6NW9Re1XhDS0zpl2SCW1v/F6Hkzk+y+i8DNUTFA/JMzkOVltkg6Hvnmk1KsinxgMZLPZ/0XBK6FPNdKrD7W/ahSW/tz9WGRythU/BwyAfGM+03I5rlNg8VBxxvoVcmw2s34gz3PdMZPa4j0zSZoBAu+Bsf0JNIqh8SgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9apFdTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9apFdTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33407C4CEE5;
	Tue,  1 Apr 2025 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743510561;
	bh=RI/IHYKkeya9qVdcSpSUQZLdmcW3PHEk+IkiV0Smdx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9apFdThxQ2q8hOWwxRuzXWXJTPe71/uOnoKJuLW2wQsgytFNQ96YOLGhIR6I0xTh
	 X+UGKoI4q8fCQ3wAquazT33r6anWVM+VWIZmuInSk6ETR9XThayJP9B0GKuM/Uj9wg
	 xlTms/ETsGA2lXSXeddSPz1M2jjeOyhFkFeYynuoKo3Vb0RUynlhWX7vPN2lbHI7tk
	 pUzV98QbTZRdYjMjCVS6QULiKkvWTevYe0mQZ3KXhJjjxuk6q7+NmsHuEebGSV36bw
	 efYW+9eTk8VivYtL5dFyGBX/HAzqNvVP+9NkCravU1hGRLfYA8PCiwjqbXv2JRQ8yw
	 +u/+z6/imvNkQ==
From: Leon Romanovsky <leon@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH next 2/2] drivers/base: Add myself as auxiliary bus reviewer
Date: Tue,  1 Apr 2025 15:28:47 +0300
Message-ID: <b60e74e286b1d3935de46092470f716701c924a1.1743510317.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <206e8c249f630abd3661deb36b84b26282241040.1743510317.git.leon@kernel.org>
References: <206e8c249f630abd3661deb36b84b26282241040.1743510317.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the one who participated in initial development of auxiliary bus
and later reviewed many of existing auxiliary bus consumers, I would
like to be CCed on all auxiliary bus changes.

Add myself as a reviewer to do not miss new development in that area.

Signed-off-by: Leon Romanovsky <leon@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..c284a8d54fad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3834,6 +3834,7 @@ AUXILIARY BUS DRIVER
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 R:	Dave Ertman <david.m.ertman@intel.com>
 R:	Ira Weiny <ira.weiny@intel.com>
+R:	Leon Romanovsky <leon@kernel.org>
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
 F:	Documentation/driver-api/auxiliary_bus.rst
-- 
2.48.1

