Received: from mail.pissmail.com (mail.pissmail.com [173.249.47.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9C1FA859
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.47.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571854; cv=none; b=JbQORIR1hg5DBmQeASU/A9PcuaVPpDC9YAYiqsArOk0OW4ezz0BfdKMXY7ZzW9ac0zW8aWhS0a0n+oCqJnAlzImtNo1+L5G0SXewCs8+iLTMTkbE9L6KQ5T4REyhHc2zkwystfYU4WUiSzF1hFIN/F9vAbqNFzVw4sTI2V/fS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571854; c=relaxed/simple;
	bh=yApOaxx7OTtO19902XIc0nY3Y+TnKNtmKi9r3F108t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M6gdzC7X5gk/QXixoPbW+vDONW0sc42KeYqAXzytlJfqbwZtFOguAtxo+7rXOCC70/sDAvtYfquzEr/7tmal1FHHK3KDoHbwOx7X4Hv27PXMHARtwH7bd0X/Be07XOLdGksB/fJpVIC84vqrkWheA3cLcrqWVNUfjCFpYdXwkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pissmail.com; spf=pass smtp.mailfrom=pissmail.com; dkim=pass (2048-bit key) header.d=pissmail.com header.i=@pissmail.com header.b=daCxwBUc; arc=none smtp.client-ip=173.249.47.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pissmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pissmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pissmail.com header.i=@pissmail.com header.b="daCxwBUc"
From: mortodinoite <mortodinoite@pissmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pissmail.com;
	s=dkim; t=1738571851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2fZ2gDsDhzBX3IW6Z5Hqy+AFju+cFV43p6SccCGLi3o=;
	b=daCxwBUcgWvboEdGZvknUhUpvfekAbTjl8iVybiK4VoqibRLhYGWDr2ZdNd/pYnwpbSG88
	yo6MU+P/PluSN0tBPwf/P6FpP+PlHL4pqu5DyBMHcmgyi1Pt/1zDsaSlWz4OUv9FrF2JXQ
	Hm6Q5M5VyNpOm+8eOUnJ0EHSOfdpIEYr7FGFI4KnTf1IABQSvX+M8YzJUe2/JuAqJtAOYp
	AAJAQ52SerysyVoGssrlcr35ymj1S4jZFr9hSIdkz6qh+hEBqkFrX0la+lkvK3fAOmXgUk
	aGGDh7xr9uDkHfoMpzS4irjr+8hmBxqiRHCkCRAyJDYOseNfRIew6C66DaHaXA==
To: linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	mortodinoite <mortodinoite@pissmail.com>
Subject: [PATCH TRIVIAL] docs: admin-guide: rename GTK+ to GTK
Date: Mon,  3 Feb 2025 05:37:06 -0300
Message-ID: <20250203083707.11175-1-mortodinoite@pissmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
Authentication-Results: mail.pissmail.com;
	auth=pass smtp.mailfrom=mortodinoite@pissmail.com

Upstream calls it "GTK" now, see [1]

[1] https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.html

Signed-off-by: mortodinoite <mortodinoite@pissmail.com>
---
 Documentation/admin-guide/README.rst                    | 2 +-
 Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index eb9452668..d30867620 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -165,7 +165,7 @@ Configuring the kernel
 
      "make xconfig"     Qt based configuration tool.
 
-     "make gconfig"     GTK+ based configuration tool.
+     "make gconfig"     GTK based configuration tool.
 
      "make oldconfig"   Default all questions based on the contents of
                         your existing ./.config file and asking about
diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index e679cbc3c..1bdafdc4c 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -146,7 +146,7 @@ Linux内核6.x版本 <http://kernel.org/>
 
      "make xconfig"     基于Qt的配置工具。
 
-     "make gconfig"     基于GTK+的配置工具。
+     "make gconfig"     基于GTK的配置工具。
 
      "make oldconfig"   基于现有的 ./.config 文件选择所有选项，并询问
                         新配置选项。
diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index a6e34c200..0b038074d 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -149,7 +149,7 @@ Linux內核6.x版本 <http://kernel.org/>
 
      "make xconfig"     基於Qt的配置工具。
 
-     "make gconfig"     基於GTK+的配置工具。
+     "make gconfig"     基於GTK的配置工具。
 
      "make oldconfig"   基於現有的 ./.config 文件選擇所有選項，並詢問
                         新配置選項。
-- 
2.48.1

