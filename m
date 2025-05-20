Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFE22D4DE;
	Tue, 20 May 2025 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756652; cv=pass; b=QLkw2PASGsGY/TsErD58PNyNwLT0/rBnILN+k/2P6wgalff1K62IQureiHdLjvPlLvBrkqo8CmgU0yqAu4UHftRko2QQAW8yGTKEQIIeuFRrxIYCtQrKzwFF6g8EbQUYshMU+jzEymbi/ie7K2iRKLLJMRfxda7D+kvPu6vsHMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756652; c=relaxed/simple;
	bh=XgRff186cBGhnHGD8vxSTQj/UYYcuc06jhf2Pdzla5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnWWPa+hMbvPvgoYd6lhcD2uliAK+tECvnmb0qVVNSh5Ghwyd2uJ0LN/wqvrvSu9QUcjaNqTpFRjyF7mEBEG7A6KCletyzZJW/c8yj22XIWlfhmz+OQVHqSsSdP6/woXLlyHbdk4UN6JXp1qhnSe+QvoYpXVXW7rfNb+O2FR7gY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=FAUkXMgE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FAUkXMgE"
ARC-Seal: i=1; a=rsa-sha256; t=1747756643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YFDXRHlTdP7U73K5JsEoGE1rvfY34Luq7K+dFZo9wgL+VD7f4jHBfyPEw/FHBzMnxhqVB5mqamCNeRJFsKY8IVXVOjC10zpm+CoJwK6uAfoO2ZexiW12GkLrzA4UdDrovYT0E2D38zFlkw5z7VHskc0C9GsmENapmdZq24gvqTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747756643; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G3fxnvfCczId79GkAnCMAZFmjljza04EJ8PWr+qiJ2s=; 
	b=SIsCbK/mMquKPDW47kiYqeQffVin9kYyUgyef2C8YixgLL/6HylP020XB33T68ko7S43NMjsCfRzOznbKojWHlN2YzHK6Z/HACcRX7+K5Hf0FW6SjVFaanW2AqXYB3yeKpFuoF8ehkuN3nJKJUDqI+OK71cXITJ55Udpd2h9Hf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747756643;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=G3fxnvfCczId79GkAnCMAZFmjljza04EJ8PWr+qiJ2s=;
	b=FAUkXMgEGAwI6Rz9tRJVhBjqtleJLMpTkwdqO3lYgLSVBW3r76p6/5b2CV/ZFs08
	1TgveKFoGffny8brj1KjC8gufVZxA/3213cT+92flvrszdoi7o1FEa6Gi0zXkArpQN6
	MFBuzHWP+SHHYn+Q9M11d0tQrWMf5QL83PVHhCCo=
Received: by mx.zohomail.com with SMTPS id 1747756642573646.6398226166255;
	Tue, 20 May 2025 08:57:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 17:57:14 +0200
Subject: [PATCH 1/2] docs: Document how to use the recommended docs theme
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-linked-list-docs-v1-1-db74f7449785@collabora.com>
References: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
In-Reply-To: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The current documentation on writing documentation documents that the
RTD theme should be used. It goes on to explain how to install it
through pip, but fails to mention how to use it. While the DOCS_THEME
Makeflag is mentioned later on, it's not clear that the pypi package
name of the RTD theme happens to also be the theme's name.

With web search engines approaching a critical mass of uselessness this
decade, let's explicitly mention how to make use of the recommended
theme, in order to save people some effort.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/doc-guide/sphinx.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 8081ebfe48bc045ff4e86001d3eba884b338bf32..029c350dc12803b53d0c3193acc0cdc5a6777de6 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -46,7 +46,8 @@ or ``virtualenv``, depending on how your distribution packaged Python 3.
 
    #) It is recommended to use the RTD theme for html output. Depending
       on the Sphinx version, it should be installed separately,
-      with ``pip install sphinx_rtd_theme``.
+      with ``pip install sphinx_rtd_theme``. You can then pass
+      ``DOCS_THEME=sphinx_rtd_theme`` in your Makeflags to use it.
 
 In summary, if you want to install the latest version of Sphinx, you
 should do::

-- 
2.49.0

