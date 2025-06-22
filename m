Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7D1684AC;
	Sun, 22 Jun 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750585223; cv=none; b=eRULDiMPACG3vUyktWADueCznKugAB//LmudIMAy0myq08S9rhtuo9QW29WUarZmSxnL8SU9O1QRm5KGUm3jBW7c4gO/wqe/b6dB4TeVW5XE4ut65qAP6+roUbMLxjtKnH5f7BG6RM6QcMmYAIh0iurS+JUqY37NmpvSw/3C9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750585223; c=relaxed/simple;
	bh=2PvGyhBNJOYYKz82MkvYSvuhzzQS3gt4dm7Pv4qlSRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kz+Lw2E9cYkLvHS8yxLMLEBcrUya4a/J1S+fKXISx47r4JXIqmGG+ifDZc7Gzk0YfpYpYe1j6DBP8nWbjXR1cz59NVKXywwfBRa39+2z8r8DCAtT7hcbvgm7urNFSPZFF47Xh4SyOmx3itC77nylzlx0CtRVe4FfoFJuTsEBMC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKELVF+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKELVF+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A24C4CEE3;
	Sun, 22 Jun 2025 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750585222;
	bh=2PvGyhBNJOYYKz82MkvYSvuhzzQS3gt4dm7Pv4qlSRI=;
	h=From:To:Cc:Subject:Date:From;
	b=fKELVF+4zfEd9G7cAQIXffYaT/RZwTypLG0lVIqxGUooEwm+/TYM+o8ZDOIb1to0F
	 IkPpr0nSg0BI+Q3+c9MgLfqz95MFH9HYOQSOUmoZc35sS5duTJCLVfc4wB12ZS7zXT
	 Nvdghk9sAOzwgl9A4Upq68wR5OcHkg3jgeVZqvGFXQ4yCnHxFx4U7mD/IBqY6M+LZu
	 6DPsTWn4yGn3xfLOG4LiEOhbpcWI7iSjX5edPeT2mnv3AHFAEQLd7kYY3mNNkmcYJO
	 7+5Nm9tYEQlTIB4tgU7pTGklWV+QgURC+Q8XBwF5f83RtHTQ/oODjvseaRPz48LkUM
	 GCdyNQDkx/J5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTHBS-00000000qhs-0vKv;
	Sun, 22 Jun 2025 11:40:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Kees Cook <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: sphinx: add missing SPDX tags
Date: Sun, 22 Jun 2025 11:39:53 +0200
Message-ID: <1a62226c5fe524eb87bdb80b33bc7ec880a68880.1750585188.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Several Sphinx extensions and tools are missing SPDX tags.
Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py           | 1 +
 Documentation/sphinx/kernel_include.py    | 1 +
 Documentation/sphinx/kerneldoc.py         | 1 +
 Documentation/sphinx/kfigure.py           | 1 +
 Documentation/sphinx/load_config.py       | 1 +
 Documentation/sphinx/min_requirements.txt | 1 +
 Documentation/sphinx/parse-headers.pl     | 5 ++++-
 Documentation/sphinx/requirements.txt     | 1 +
 Documentation/sphinx/rstFlatTable.py      | 1 +
 9 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index e8ea80d4324c..3dc285dc70f5 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -1,4 +1,5 @@
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=W0141,C0113,C0103,C0325
 """
     cdomain
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 8db176045bc5..1e566e87ebcd 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
 """
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b818d4c77924..51a2793dc8e2 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -1,4 +1,5 @@
 # coding=utf-8
+# SPDX-License-Identifier: MIT
 #
 # Copyright © 2016 Intel Corporation
 #
diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index f1a7f13c9c60..ad495c0da270 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -1,4 +1,5 @@
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=C0103, R0903, R0912, R0915
 """
     scalable figure and image handling
diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index ec50e1ee5223..1afb0c97f06b 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -1,4 +1,5 @@
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
 import os
diff --git a/Documentation/sphinx/min_requirements.txt b/Documentation/sphinx/min_requirements.txt
index 52d9f27010e8..96b5e0bfa3d7 100644
--- a/Documentation/sphinx/min_requirements.txt
+++ b/Documentation/sphinx/min_requirements.txt
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 alabaster >=0.7,<0.8
 docutils>=0.15,<0.18
 jinja2>=2.3,<3.1
diff --git a/Documentation/sphinx/parse-headers.pl b/Documentation/sphinx/parse-headers.pl
index b063f2f1cfb2..7b1458544e2e 100755
--- a/Documentation/sphinx/parse-headers.pl
+++ b/Documentation/sphinx/parse-headers.pl
@@ -1,4 +1,7 @@
 #!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2016 by Mauro Carvalho Chehab <mchehab@kernel.org>.
+
 use strict;
 use Text::Tabs;
 use Getopt::Long;
@@ -391,7 +394,7 @@ Report bugs to Mauro Carvalho Chehab <mchehab@kernel.org>
 
 =head1 COPYRIGHT
 
-Copyright (c) 2016 by Mauro Carvalho Chehab <mchehab+samsung@kernel.org>.
+Copyright (c) 2016 by Mauro Carvalho Chehab <mchehab@kernel.org>.
 
 License GPLv2: GNU GPL version 2 <https://gnu.org/licenses/gpl.html>.
 
diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 5017f307c8a4..76b4255061d0 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 alabaster
 Sphinx
 pyyaml
diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 180fbb50c337..3d19569e5728 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # -*- coding: utf-8; mode: python -*-
+# SPDX-License-Identifier: GPL-2.0
 # pylint: disable=C0330, R0903, R0912
 
 """
-- 
2.49.0

