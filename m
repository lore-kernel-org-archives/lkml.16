Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4B91D5141
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897865; cv=none; b=XgvswTiu3omUKqa3QETiUF60aImX9Cv4rTBFK1aBRYLX79qNLaP3E+iD5Vd/PaWcaIgZ2se04XVVEUplUIxqGUpTiyPs8gmhZZEepsQIgoorHwJ1/ezsTQNGcayl7jmnwel5UGom+zsGDiKnW1rD3FBbR+iD8a37sIbLuy8IdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897865; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=rQkpk0n7WdFATZENz2aVej+37wi3Y94sSdPk4av3/JDhPTxIibtT+klgr4XZQk4cYxYNXgFjWx8/slxTJlCWEy1FUkab75nqmXuxhoEwWTvN6FZJ4qEqh3u7BHS9NH1IQmQfYze/bfD7wTw8Y57qma5FGKwStoVUWXkO2ELfSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=SbPHtGGy; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="SbPHtGGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=SbPHtGG
	ymMktLV1Oj3HV3/rZJ2aEKj3hy9iaNjMI5uH5jFsksUoZLwK75vfSN6brpqX6k5+
	+ftZgpJFz4EsDi7wk09AVKUJvkw4WHNlqWLnzSgBUkdJe1JW6j2N6Vj1Jv314dvA
	ZDqFENr43HY5ccGNveIrlE5AYdtG0p3UPKEw=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3T0RE_sNnTf2xBg--.54741S2;
	Sun, 02 Mar 2025 14:44:20 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Golang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3T0RE_sNnTf2xBg--.54741S2
Message-Id:<67C3FE44.071822.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:21 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgEEumfD7AnzxwAAsw

Hello! Rust is better than Golang

