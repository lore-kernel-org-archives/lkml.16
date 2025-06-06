Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B680289343;
	Fri,  6 Jun 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227703; cv=none; b=Kluyq8eoQnppgyJ5DBejW1oalQ4CB8ZOrZceyUBcjjZIjv+vJuuyvwBeREaNekHV25KoNOD1OJkP/awmCsUeMKM6vOVSHFk5RvTCmiWdU2b0rbVfTGfsYt9H7t28Hjw1Glwc16rkHzjNzG0lr/MMorWQTi0tCXeXCPlyU+U8Gs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227703; c=relaxed/simple;
	bh=bL+QHcqwfC8ABcx3C+jB5ggAUwlz3u+lLoepArUuyr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yo4F3uCn47wWSVYYE2kqld12rq50SdEDgihZ1LqZD/y1vNslLDwv+JuPRA51xT2w/VmzzwlRiT6V82tOVzCtNSDls2+ziskW9fWzdoLcOUI8gFS4a1Sy156T+myNTVGana0xeAc6ZiHEXWx1GgNWmoYgQXVVkvFctJRqnjqerK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lOUPmEcW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lOUPmEcW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8478C41ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227695; bh=+15mNl+MASymclHrVaWDQ75LDqc61Li1JLr+euAhV24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOUPmEcWCQEs9XtmJTi62N9JYKvRGyvOhnwfBVclXwE9jajDW6fvFbJZ3AQ/Cgfyd
	 vL6Dobi4PO61+cncfNiqNiKnGG2uCoEEsZ22vphdbx+rMf+3lPTByUY2eO1XG5d7fj
	 PjKPH9Z4XtDay8y06HZWa/3KyW/7CAlAhpjm8D0reoXweUIQIS3WrGWOzDOQ9KJ/Jc
	 IBeKI4Z+ZUw20n2//CzIqxYGSHxMT66oe2q7yVeVLcFrj3TnrP+Afn9Rfdx6HpywAD
	 WbMos8f6NdHZxQnjAf0YXoZCbjMsW3YMIlJU9R5U9CykNU4AcF0m3L6ESSwyaZrfVb
	 SaVOB67FvzHRg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 8478C41ED3;
	Fri,  6 Jun 2025 16:34:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/9] docs: kdoc: simplify the PROTO continuation logic
Date: Fri,  6 Jun 2025 10:34:30 -0600
Message-ID: <20250606163438.229916-2-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unneeded "cont" variable and tighten up the code slightly.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 062453eefc7a..b193cf9dc0d1 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1680,7 +1680,6 @@ class KernelDoc:
         Besides parsing kernel-doc tags, it also parses export symbols.
         """
 
-        cont = False
         prev = ""
         prev_ln = None
         export_table = set()
@@ -1696,18 +1695,14 @@ class KernelDoc:
                     if self.state == state.PROTO:
                         if line.endswith("\\"):
                             prev += line.rstrip("\\")
-                            cont = True
-
                             if not prev_ln:
                                 prev_ln = ln
-
                             continue
 
-                        if cont:
+                        if prev:
                             ln = prev_ln
                             line = prev + line
                             prev = ""
-                            cont = False
                             prev_ln = None
 
                     self.config.log.debug("%d %s%s: %s",
-- 
2.49.0

