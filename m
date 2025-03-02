Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0BB1E832E
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897874; cv=none; b=r1resoCMARjL/8HHxPbArg5U2D0n8/niqAr7FE80jUe22N2IzasaLaCZUaBTo4bXNMnJ1lT1Zw+LFBfEuSDb3GiQ+qyQPprEzQ1aZD613aJc8k1j0CfHvmsnh71ghIsYePXTzb7IeFlDOEGd/sbLfj9o5CWifqf1ey3jU2cQPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897874; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=cu+BQie5rEguaZ/UV9CU7UIRzFIbFNqzSbVW+dwQ/c3NWuOcFft6OYGBRmA/Kr0ZtZkzn/JdyM/qUAwe5oBNYG6RBnt+GrC2ZDU3cqf5Fn+NU8c/86eU+3k5319e5vXzbv9cr4/QUKnRFp6SSN+g+zUD6ZDQ1wzo2Cd7x+N7qHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=lokbvVyI; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="lokbvVyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=lokbvVy
	IXlJ2QA+dvHfujRYbo4vnFKqpzQbKdCDygs1az1JEJE63ZPbAdxbDmWiIDllvmSi
	v4a6jsqpGLFIYJ7nMetKhEyoIAQiDTt3FavRjDhu196dkSt895KUYcdwBbtDc99N
	9pPYUOICIxqwOEsWjNSjMzdTZmAXsDBEQHWk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3vxtJ_sNnYhsYBw--.57512S2;
	Sun, 02 Mar 2025 14:44:25 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3vxtJ_sNnYhsYBw--.57512S2
Message-Id:<67C3FE49.06FBDE.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUg_cfUUUUU
Date: Sun, 2 Mar 2025 14:44:25 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifh4EumfD7erZ5gAAsC

Hello! Rust is better than C

