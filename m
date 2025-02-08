Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733A23C8DA
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739000525; cv=none; b=HEl0VWbBesE4Tn1i+hjrazFaC37lwYhiH0DXKbzLynftLA2EDdC5GPgwJTBI3t/FBK1qIsvvMGeb02gIpJ8h453wyUcTtyXJuHVidSnHhSI5qtQUo1HZyiX3eLNzCtXw9yER1w5IX/IqdrjxSeI60/d+Eruqj9uzW0jRDlPeJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739000525; c=relaxed/simple;
	bh=j2C53R8ivGhnPuA24g/BAaFIt165BsqX6Kgua/nyVjA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AHxV5ruiDtQwL8IrWEc9bu4NBnY+a/iOSvDTl2ddElp9eajGW1jiiwQBKxv4Wjx4ym3dQmQmVGJDkSjfkNHB6rB5Zdd3bYMeEE2SLQBHi8uytvwhl1kddBOUFyNVar5IC7s539OJrgEllMg17MU2618HYqFh9aQEimFOlq/AQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=fpE+P7By; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="fpE+P7By"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JFemzGLn7nmfhKKdch5Xp13ZHbfez35zmb5LdzxnosQ=; b=fpE+P7By5B9NgLu+4wBUcivG1V
	xIwUDOvBYRaQvjC4Qo4jq9lmWQMLzrKcQAGdKfomS/oJuebIzt6ItcWr45vNTxNDFQS+s/henGUWQ
	4bZt5WM3HROgNwIAbKICrl+UXcpgAghsKjMET52nOPCe9fULKsFvO/EwjLxdyKZGmhhmvARLfb5qt
	ajvSi257UoNRkTA5qlkn5Aas180IP0f0jIlTuiEcq9hT0dYm9dPDx+kqabChvC9deRpQw92zXr7VU
	VUc5W9LIJSXNcK3mgvvU90KMM0VP2DKFYisXbrUmIPivcEeDwyLTbzhhebY4coqO/40QVH2wwwarP
	waAvlCKg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tgfTO-005bco-Od
	for linux-kernel@vger.kernel.org;
	Sat, 08 Feb 2025 08:41:54 +0100
Message-ID: <4bc3958d-e143-4e25-8f54-fed442e6fe3e@bit-philosophy.net>
Date: Sat, 8 Feb 2025 08:41:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: Emo System (was Unification, Fair Pay, Low Jitter)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Emo of '1 is a superset of Sabians, Nazarenes, Hackers and Witches. (and 
more), unifying efforts. ('1 is The One, which is a popculture angle on 
The Theo).

So the effort is now Emo System.


NB: Some disassociations also: Bitwig, Beatport, and Bitcoin are NOT 
about me!

https://www.bitwig.com/  (I am tracker oriented, and support Zevs 
tracker myself).
https://www.beatport.com/ (Beatport seems to emphasise "gay", which is 
not my clique. (That is Emo. Note samesex attracted people can also be 
Emo theoretically, but these are not really "in your face" problematic 
like "gay", so not a problem.)
Bitcoin was planned to become Ethereum, misusing a referance to me, 
claiming it was something I, or other "emos" looked for. But it is not. 
(no "mining" here). Let it become Ethereum, which is about their own 
clique. https://ethereum.org/en/

Light!
Ywe,
https://bit-philosophy.net/
