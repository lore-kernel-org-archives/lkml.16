Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46564CA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145810; cv=none; b=bjjTTtCdNZe6mcmMzlk8lHJ3JC0+H/WSJsruL5WXmOT9rU1awrUm1DtmAtLCIR4PJIGbXWpOaekvvpEpBoZnRJrwcimkNvdHd/bVEgc/R93HbyXRe2LJB8uIFMpkM9lyA1CRDWGvoIZu0pnGC60R7K2T2Q786h/gwgnIE4K7rjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145810; c=relaxed/simple;
	bh=9aW5u1aYTYK7b4iyeO6g2svbh2h9X/6Z0iwbkHAn5v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U4deoVeZzDKiv8MtolUMPuP51ZoNhHaFAFWZiTCz+Gn4cwPND2MZ8HvpNAjsN/BC/1pRNqkBjbKbzoFzvR/7eWuJXDJgzJl3R6GV7lmsECiGkdOZaFqPUjWD7hdKMMkatkFeSwcgO0vJFA2/HEJ5tyPT5iXHghnhywXsQMmocTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QOIx3m2h; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QOIx3m2h"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6qUak015954;
	Tue, 17 Jun 2025 09:36:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VmCCABruVwRvhnOlCaDKkqXOQNM41WhNaejz2TtdWRU=; b=QOIx3m2hp5UYny//
	ejkbQB28LkaBbZg+1JIsax3TTbFYt45Hct59X7/UTIH+WoZ6l9NPvNotoZwATCYm
	PFlgB290aFjI2UpSJTt74dOvVWrcsXEjD/2bsUXsA+GXDqGUNk+1Kx9gwg2bxVws
	WRiSjcc2jt9eQmP2UD4oSccedOlB08IQt7abjhl0X5GZhMos/lQrwgAumqBM9z4j
	VrTNcGAh++Mfjx1zb6ZIMj7WPiI7bXsI37vudBQa5rA8asZ2N5axAir1rxiSQ9gE
	Rue6pU6nUBJWXRTCnJdkBGtN2wzoSl7/4WSsGXCik9SPoDM3y3P5mdM76KU6M9+4
	GfIfLQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x79vs4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 09:36:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B74DB4004B;
	Tue, 17 Jun 2025 09:35:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35C9533CDC7;
	Tue, 17 Jun 2025 09:35:16 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 09:35:15 +0200
Message-ID: <bb3b1806-5089-43f6-8da3-b38b2e5edd01@foss.st.com>
Date: Tue, 17 Jun 2025 09:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] checkpatch: use utf-8 match for spell checking
To: Andrew Morton <akpm@linux-foundation.org>
CC: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn
	<lukas.bulwahn@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
References: <20250616-b4-checkpatch-upstream-v2-1-5600ce4a3b43@foss.st.com>
 <20250616173119.47615efceed220f52994679d@linux-foundation.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250616173119.47615efceed220f52994679d@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01

On 6/17/25 02:31, Andrew Morton wrote:
> On Mon, 16 Jun 2025 09:59:13 +0200 Clément Le Goffic <clement.legoffic@foss.st.com> wrote:
> 
>> From: Antonio Borneo <antonio.borneo@foss.st.com>
>>
>> The current code that checks for misspelling verifies, in a more
>> complex regex, if $rawline matches [^\w]($misspellings)[^\w]
>>
>> Being $rawline a byte-string, a utf-8 character in $rawline can
>> match the non-word-char [^\w].
>> E.g.:
>> 	./scripts/checkpatch.pl --git 81c2f059ab9
>> 	WARNING: 'ment' may be misspelled - perhaps 'meant'?
>> 	#36: FILE: MAINTAINERS:14360:
>> 	+M:     Clément Léger <clement.leger@bootlin.com>
>> 	            ^^^^
>>
>> Use a utf-8 version of $rawline for spell checking.
>>
>> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
>> Reported-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> Oh, there it is, after the "^---$", which marks end-of-changelog!

Hi, Oh right sorry !
Thank you for making the change.

Clément
