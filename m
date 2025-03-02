Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD871E9B32
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898738; cv=none; b=QvhwZxGaq52ENAmIRj7vqrRFVPC3nJfCExFXLAWc0ORph8RH85fCktbEvW0HK/WnZ0rHgF2CtnbKFyv+zxogQxB16hV0qt9g4LyHw/7b9qypagXi5b4EwF/oFdnjpTKrwCYZXmNV1GxnJ6EWbpj8lquUuyOBvM+3F5S02n5LYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898738; c=relaxed/simple;
	bh=jOTe+0xUMEm8LLQEkXE6MviC3n7NMHX44e0k2GAwts0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=A0rJ/j+GN+VEBdn6GbrSneyjMhjEQkcZrF8KeZD86kKKrfSJHHRnqtxf+w81F1SU2ktEgyT89LywR0+SoaOgtJjjJ+UpVO/hpDYg3/eV8D94hrdyENUf7Be1I9+EgPjCajg7jn1GomGYy+1duPF8l5qfp54KOU5GDCJhCKHOa4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=F4LEE05+; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="F4LEE05+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=jOTe+0xUMEm8LLQEkXE6MviC3n7NMHX44e0k2GAwts0=; b=F4LEE05
	+Y7QJzPf4WJOckNkmyqRwH/+ntVINl/6KvNU2YD7cSLHTdKwYcI8NGa6zrgCwEag
	9mzK2Cjg0YDdB2/ewjVL3wW4A1EYheN67IhmHrSv/ogkyJhMKpaI1VyCFge2S5aR
	xNvsqayINA2I8EIhKhOvK6F81US0d0IYn/qw=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XxAe_sNnQbtZBg--.46045S2;
	Sun, 02 Mar 2025 14:43:42 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than PHP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3XxAe_sNnQbtZBg--.46045S2
Message-Id:<67C3FE1E.06C8C7.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-1xRDUUUU
Date: Sun, 2 Mar 2025 14:58:52 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh0EumfD7AnxqwAAsC

Hello! Rust is better than PHP

