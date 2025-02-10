Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56D1DE4D0;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=P47Cq9C8805xThG8L4Tmxb4f8w2jEl19rxPPtM8C5AjTcdSKSmuHPlT6MFyj5fmKToLl21bhYNaY/y7U8npSlwEqEC+PQE45fMTTFuwQdhkLkfVFXEG/9O++eCCo0D/LHxt4Cv6Xxm5UPhUhfF1HQUcflYV5uTZIXeCxSPoHGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=Wn8MIfDAfzH7a7LQ/69qSLfVvfWFib1jkshB7oN/Uz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dd0ZuIuqTlZvpowZT5dzb0Do696QfgBT/ln0+mcZb5F4s8o4QgLHIv2Uv+F4VXDRKTetLXpLguhnRC9OgxhmQqkEQm1x5/i3HvGyCR124ztZh0BBjBeCj7SjtSFnTo+WQtP65Y12RhXTg4QR6vVrYbGdQI1ryGWMDVNlAs1MocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n515/V1P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n515/V1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51102C19422;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=Wn8MIfDAfzH7a7LQ/69qSLfVvfWFib1jkshB7oN/Uz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n515/V1PBJv/UTXId3e7ITd10fxIj+LzLt29t6QO5YHRPwGnm0Kgnhb3dif+xys0K
	 Fvd49NitwT3GB0yVlulkMkFlLRnf51VyPTAJ3aSqNtm/1QDQpmzERCAhEOTt5v1DCH
	 AdXKqyOoMmVhDGR2xpsAFeTKq8zYJTKDwa/AQvlgo4zGvFKbGPDw6eAcpQV15kRSPS
	 VX0AlYyExhoXg1FGMtN5TC3kEBJRy6pZjm5uOEBtMDCHcyr6lMygVFKv0/xEgE1fYt
	 a8mth/QjojZa2o/PDMlRRxK3KhwxMugmpx+GVd4TaPy7La2hxFe9gto9UZkvowg/vy
	 dX4a7lqgxywTA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cjg-23TZ;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/27] scripts/lib/abi/abi_parser.py: Rename title name for ABI files
Date: Mon, 10 Feb 2025 11:18:13 +0100
Message-ID: <e44574cb2796861d6acbce839068ed3ef385d16c.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This makes them look better when generating cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/abi/abi_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 3b1ab4c0bdd7..0c3837e52afa 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -314,7 +314,7 @@ class AbiParser:
         fdata.ftype = path.split("/")[0]
 
         fdata.nametag = {}
-        fdata.nametag["what"] = [f"File {path}/{basename}"]
+        fdata.nametag["what"] = [f"ABI file {path}/{basename}"]
         fdata.nametag["type"] = "File"
         fdata.nametag["path"] = fdata.ftype
         fdata.nametag["file"] = [fdata.file_ref]
-- 
2.48.1

