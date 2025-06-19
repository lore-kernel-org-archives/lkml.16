Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E01248F7B;
	Thu, 19 Jun 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315821; cv=none; b=T6LR11tBcFESwDUOTkBPYrSjf2/d8wDsdEq9vHHCvkazLReOsKxDor4AHRygoRpIeh//t1hYGICmhp1hox7S7afSfjtg8aEFizyTUvSYxywbqQusO55gZ8dVdZ3eF+G9DZDC5Hy8ZQui2i/h5eZJ/QQlYuO9/4KRQv402nrZrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315821; c=relaxed/simple;
	bh=Hv3gLw50JLGG5g7ccl776oKGKqF7lxHBB7tVJrn/eaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHhX4v8g/zxV0+ZmWYY4LNXv9u2KsZgGFLRcNER9mAlm/X6JyXRf9rbnwkFc1NIC0zz7He5b5yJShcitT6+B+LMWenIht0DeEP+Ur+9YvtWwhs93EVh44yjUq/myXGw3OdJGSrEoG7Nxfhha4DR8Kfj8zdySzhrBPSzv+b6mc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1lC77v1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1lC77v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB0DC4CEF4;
	Thu, 19 Jun 2025 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750315820;
	bh=Hv3gLw50JLGG5g7ccl776oKGKqF7lxHBB7tVJrn/eaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z1lC77v1CMyMlktOJ9K6fejaPpT04fOC4Le879dTqXFAifbtZk3KRi6MKQ5XlEPow
	 4lqWFgJFjeImFQ4tHd1d6EBdeLe4WwDhT+Y5ShpfGuDn+/B6ln/JXpqejMTKC6JE4U
	 HLaFGIVlrS5p+nO9YQVpcZRTGVqoQIv2onKEup31ieUOmCs1SgSvSDQVOI6yfx0RpA
	 Y/cotgB3LUCyCVw/9X+KnWIDWcqYyA7KcMHhJdYOQZ1eV6AxqqRaLuPkdhekRDDt1/
	 Ov5YWqFD4nk+JKT0zsCmRngpO/qxkXkRb6qpNj2qNKVDfh1e2p6y2mpvWtDF/XiHb9
	 afd9EMrgl86wg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uS96I-00000003dGq-3yTM;
	Thu, 19 Jun 2025 08:50:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Breno Leitao" <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Donald Hunter" <donald.hunter@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Ignacio Encinas Rubio" <ignacio@iencinas.com>,
	"Jan Stancek" <jstancek@redhat.com>,
	"Marco Elver" <elver@google.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Ruben Wauters" <rubenru09@aol.com>,
	"Shuah Khan" <skhan@linuxfoundation.org>,
	Jakub Kicinski <mchehab+huawei@kernel.org>,
	Simon Horman <mchehab+huawei@kernel.org>,
	joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	netdev@vger.kernel.org,
	peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: [PATCH v7 05/17] docs: netlink: index.rst: add a netlink index file
Date: Thu, 19 Jun 2025 08:48:58 +0200
Message-ID: <468efe892aecc585288a3fcdbecc1db7d4871196.1750315578.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750315578.git.mchehab+huawei@kernel.org>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of generating the index file, use glob to automatically
include all data from yaml.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/specs/index.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/netlink/specs/index.rst

diff --git a/Documentation/netlink/specs/index.rst b/Documentation/netlink/specs/index.rst
new file mode 100644
index 000000000000..7f7cf4a096f2
--- /dev/null
+++ b/Documentation/netlink/specs/index.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _specs:
+
+=============================
+Netlink Family Specifications
+=============================
+
+.. toctree::
+   :maxdepth: 1
+   :glob:
+
+   *
-- 
2.49.0

