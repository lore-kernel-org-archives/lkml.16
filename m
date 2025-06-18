Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA191B78F3;
	Wed, 18 Jun 2025 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280144; cv=none; b=Fi5StSLfG6gfKI/9fE+HamzSjkNxwf0hCAYuKgZ1RIMTh43aa3COQEalIUOHNf0HXkxGJlmy46wRE+N2eMJaJzoCDrJOTfgA/LzI0/HyRCII3NyXpEzq6qK1au7ZrHc+ykLSq3bvUYCy/MpIXqLj+ByLqqcvLunB3xIb9cYItQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280144; c=relaxed/simple;
	bh=UuCOXYk5I/lgnmqZwPm+CJmcCeVN1kDgJv9yjJMQBMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvIWUd13wiyUBKXheXlthqFaaniSMeW5MyFZJgLQQlXZyxuUvKnfVY8qlaBjpTaN7cuJxs0ydULC0MsWCjk0Z2jlrnNzwqAxfWDa89GXGltDY0iYff5KrSHUM9veCzD4iCKDAp44Qc5DFQwCJMK/Nmk0CTMsoa+wBZfHRLPDT9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6GcHiCt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6GcHiCt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0158C4CEE7;
	Wed, 18 Jun 2025 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280142;
	bh=UuCOXYk5I/lgnmqZwPm+CJmcCeVN1kDgJv9yjJMQBMw=;
	h=From:To:Cc:Subject:Date:From;
	b=g6GcHiCtrGrJE82BazxoruEWcR04iNZlquFnHx71Smmb/y+7nnb8J1bcaTRPpOjlf
	 /RGzgKc6O33Pfvv24boPCy1IQgqOWXThY3H2pYSiXhjOcwY+aKldUYvVBMAnPvZb/H
	 Iut7voSRTJyR1pg8hHq0O6eD2aGPr82Wq8zrMluI7oeAUjc4vjywyjQ+s6AnNIAMXq
	 j7C56XRclfsJv8pTmBFfsQ8q+yL6smZBgy31qlrKVMJtIptT3FOLgEmJvI4weoJ3BX
	 6mXJ+hHwiclnMd40TadGB275pyyNRCw8+Cg0toc2dB4NodkA016U4SNt8fGy6d+saq
	 wOZ+/BH9Fe0Bw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uRzoq-00000003LrA-34WM;
	Wed, 18 Jun 2025 22:55:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/1] cleanup coding style on Documentation/conf
Date: Wed, 18 Jun 2025 22:54:53 +0200
Message-ID: <cover.1750279871.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series comes after this one:

https://lore.kernel.org/linux-doc/20250618182032.03e7a727@sal.lan/T/#t

It is just a cleanup patch, doing some cleanup at conf.py and making
it look more like python's coding style. I used autopep8 and black 
to automatically create obvious things. Then, addressed some issues
introduced by them and made pylint happier.

No functional changes intended.

Mauro Carvalho Chehab (1):
  docs: conf.py: several coding style fixes

 Documentation/conf.py | 367 +++++++++++++++++++++---------------------
 1 file changed, 181 insertions(+), 186 deletions(-)

-- 
2.49.0


