Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902741D5160
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897866; cv=none; b=Eynywfd82Md6YP7pxjRNilOyqOxis7iNvqwMcgL6HrKQxA13wLr9ThxLck4Q8Bxx74CN4NRDO7guSWAleMBLMXZHWn0aoigrfrnMZLoSw4SuaSTtbr8gVAcPRW5LdJhfkEDnnUUYZwevNO8+v5AUxMNymoZ+qn6o2wrBQPK0ndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897866; c=relaxed/simple;
	bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=ZA6Virv1Sqirw6etAODcLro+YS0GB6iHUuppNnnshgxEh6CBX7HfLnmAMJaNOz3ujfUhKBU1T69nhr3+p3JWkHg4CDudsy/Jts+q66C1oJ5205gYYDm+qLI399kgcVN4DJHlNbBjfqrHUyjasLd2K+dISwN311iVqB+YUPc4xHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=h0w3NNVV; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="h0w3NNVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=; b=h0w3NNV
	VGGQHzb/898W3urWKb6vg31NrUNBt0dV8ncfupZRvy6rCYVWBFxop83AHH54JUwb
	Fz0xLX3cURB8MyzV9M2RxBEyyUBFZ8kgZfmt2ywwzcbtQBcJwGekhcquwtXTeEtc
	wXfhk7GsY8j9mJPjmJP2eZNoxYpjI+bMNrJI=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3N2RE_sNnYN6TBQ--.44778S2;
	Sun, 02 Mar 2025 14:44:21 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Java
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3N2RE_sNnYN6TBQ--.44778S2
Message-Id:<67C3FE45.0582B9.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:21 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifh8EumfD7erZowABsH

Hello! Rust is better than Java

