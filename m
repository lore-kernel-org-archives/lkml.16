Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F034145A18;
	Fri, 31 Jan 2025 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317942; cv=none; b=Vtxn/fCInexs/lYHCH3vTIyIFRikQ+06apIBPFlY2OKK2GYQuJuaNiVA0x0Dv6ATqksoA1pCQs5U7n2rtUYz6STl6fMGmPxrHVpBEjD4J662UwtKJ6ii0b0Sv4cRomhkaJahjU8W/yxvpmSe9SGqXp/WNJWzNxXa/YhuM46E9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317942; c=relaxed/simple;
	bh=v/2tW1mr3a7X6+KuJtaKbQN6WobPyIwVcZDc9rIfc4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKaH8FN5ee3elTE8D+keT1zUZEdzgmgH+6PYHsG0FuUJXsBIgiahK3u0F+I+cayc5CYwnysla8Y0987k6fysEG9FbzwIXba2XZxYNhyQWR9L96wAcSdvL9tnvnLMs6o+3nVpm6T9R4iuyOHmrn/JrSSxGSN0F3hpBrXMdW/9Rz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bU3a09iw; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bU3a09iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738317934; x=1738922734; i=markus.elfring@web.de;
	bh=v/2tW1mr3a7X6+KuJtaKbQN6WobPyIwVcZDc9rIfc4k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bU3a09iwEa5ICO93iHuImDsr5ElGZaC23E3XiyU5nIZCo8PZD2couY8h7zyA0rFV
	 TMOr8MiFR0s2QwzR79j508FqowaxmNKp6vKy3gwo8S3i9MiqiIq31BRQbNnKn+Wu+
	 /GWTqwaI2YfXHddmGqvVoBQ3aC12zzWtK9MyNQWHLn4aaBjndBzGDvySlVCDz7qZI
	 aDTezq8C7neC9ue0PmrTsHxv/ep6aDdE3U6OliFl2Rl9ObJuCsT7EFcMQXg8pFMQL
	 Onq/S8YmPS2MuN/ohdWT+UTP37gBT0MK9My3u01r4m3uBS/0D0IoKx6Z/VQSlfXgW
	 od61ia3vmnzZ+t26oA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.48]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDMzM-1tm1d228L0-00Gy5G; Fri, 31
 Jan 2025 11:05:34 +0100
Message-ID: <e0c6e1d8-a04b-4405-8e40-22ec9a7f8b21@web.de>
Date: Fri, 31 Jan 2025 11:05:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Victor Gambier <victor.gambier@inria.fr>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
 <fe13604a-2626-4641-908e-87eeaca53288@web.de>
 <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
 <fce88885-8c10-4f22-a19c-3b04430aec3d@web.de>
 <35764b92-edf0-490f-beea-c36207de4cc2@inria.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <35764b92-edf0-490f-beea-c36207de4cc2@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HM/PaLfpWy3mNJ1btQkbUC48XTQLmL2z+E8xWqOsjYv/xDWnSFh
 JVAYb9qX48HQHg98Bd5p+J02oq0AgaSunuvzaS5C8RdSnoq+aa7c+K06ASoDTFJa4PSVQSc
 wolP4nbA1fRgUNu7Cskk5yrxJDlVcQZVJz6NhmvRZJ8SmpLnyyGL3u6fShABh2SBnmjaYmG
 F9/umCKyiJp7fA7wuJMCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rrMajmTh5+Q=;k0WsUkaGp1LRfrGr2AC67cFc5ut
 L5Iz/qsOc8P+peCEPfHF6XQWZXFValPm5M8/REtzJWdL/qheLoK8rdCN9xP0NiwtG7mssFztW
 95aLirtstMvOsLi+AGdVoA9hSUZrIEF4AEoarZGeCNX/xjeafbMXGSbBbBkiStL7c3emxwOiN
 NAbsQOyaZ0uafAds4zvdAv3i8Vout3OPx9Kr2Kfaf1Q4uJBnLIdlYbJYRTCQQcmrrBFGhRAZ/
 ok/gNrxWndkNYUbwxqOBzz8WFJcmZ+aiSx2Q40zik/RQdE97FbicT0ukQWKU1X6xJWXOBzN7Q
 uvH150uF1rzEZV77Xvz9SvmlnZo6RKQQM3RnVSJqtLUPnuNt7fOepd/oChG1NkUHY+5HMp3Mb
 jHlm05dmI9zke7lkf3dx0xdlH8AKrvdvDlNjMIGy/haX0TBgXgPY8SFxRk3ZSj8FurR84bd2/
 ZqqhSprJ9Ud+hzJsvk1Oll3QAdLm3hwU1TOk5KeC//t4dhN9Ry5iSqpgZNV5rHoXH8Z1vpO5z
 HBZivPn9W1tneyPEaoKerZTBUheXMJE7GQuUOZ8flnzm5ifDAHFkrjfrDYMLyBYyPg3XLg92w
 7I+eZKFcdLU2OR2Px8Fh61ZUGux0sF3+bDQI+RhCXgLcBVvP1gawfawrMrkE6Cbnk+uqydmIr
 yZ/Xrn+3CfxhVVjCMh/+b6YKeUXiQSB7w7jAToD17wWCe7Tvnta9AOPe6DEpmbkXjwNoKkIAP
 1O1N6B8SoXtiRYYGOAYJV2lPXOGfrTXmZIsVtHrt2TT0NoLNyfhC8FyAZFmUgjD1lASdZeYpc
 B0Az87IKjzeR1XnLzQ2TwVx/wBpKfKj4AjvmtSmDZw8HyRVyPYLqdMT4Rgmr+OcbDeIy8m1Zw
 kJRTL65jq3fXeD/a8q3vZKjw6opBB56NFg3osd7fBrM8dd+LPyVn/tV37soHSKBg26j9ML2O5
 u7EtMALW8TldF/PkRRqyzaKfMxJs3BBx0H0VQBVTcFBLMNudLVhnAt+EwcgxyLCav6SRh7xOw
 FmtfV8K0eOTHJ9lkCt37zVARk6OLzP/KfCJ8eYN2P3aoklWWGBWJIKGAkj5Q9278+xW63G32/
 LecQ+tUgXGpTKfd08S+LHDuS7Q0DtuS8e5OyrXWO2uN4nll4JPprP5znj8q84vIx9dYkJOEoJ
 4MaCdbSn5ezuKkh5gCIaOCNNEZrHWEdHXzWqfx/ShfzfQVgCmf9MJ6sQ3mV8iZofEnMci4H/T
 s8MTgZdbua4pLjJWehJj8OPW9LaxQqmNh35fUAMGrGwC3JEwePzCCJeQdLJ+aZQ5Yk3+oA4YH
 tjB1s2rFhRbz5HkHkwnuGAakBEveTsM6rasqYn9UET1osIY4JFPmEHRk0L2m5Y2z0CX

> Either provide a fully working example or stop nitpicking useful patches for projects you don't maintain.

Would you like to support any of my contributions a bit more?
[PATCH 01/16] coccinelle: misc: secs_to_jiffies: Patch expressions too
https://lore.kernel.org/cocci/e06cb7f5-7aa3-464c-a8a1-2c7b9b6a29eb@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2025-01/msg00122.html
https://lkml.org/lkml/2025/1/30/307

Regards,
Markus
