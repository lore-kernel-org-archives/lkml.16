Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7952322E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747002; cv=none; b=iQP0JQdviTiwWmzqjyadpf1huEtjegXM8rUJLrM7y3dssEtsjHeHXIirMPm27x4Vyapo9vKLsZFjzzuv0++G1NN31v/V/O1937RPh32Mk8TbyG9uGpMkrUhfAXByiTynZ3ioHq637OtmNkXlk9H5IVX1FTHPGPTz5VWSL0Wt44g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747002; c=relaxed/simple;
	bh=9iyKp66AuKRah6+SIzO8sFhwt6I/SWsHSzCMi/NZBm8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=nABUMiQ7lOqAyKumrrEVjTYXDEjglT0L7GAoBUbuXiLYIMBqsU2ORQkgC5QZRIkTiKA20fdtzt1mQeGYcGlfFbNsBDsxJjV3N919V3+c5Mx8NYbrfiVVaIUgwv7WV/BcJiuTrZKnWcOGYvHQ2b0SQoPPk6UuTenSCLKK1xwweoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TH/qe1I0; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TH/qe1I0"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KBStlD006650;
	Tue, 20 May 2025 15:16:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yBy5SJPnGNYkoa6Z5ILQ91Byp9mkblFSTlrqPKH6O2c=; b=TH/qe1I0XC4SnMpF
	aqiuuGS6atDP6k3ZyrAwOjgIDHDT1VD3w+vSQ9qkMsKV6vKpjc56seghHJj0XMgI
	giE2W5SfW5DMbBv11vRYxwSzzUNy6fjb2s1sTrFXQveo6r5vr4wzDldQaIApM69+
	hG5mEptSxLbrBOGz0mFVPwcTsfXkkggjYFK1N+qfoGwmSk26TsRdxScvdeYLoanx
	WgzREXSNd0GZSiGfFLsJxq2qxb/dXNxRGnjPaWOUTUSEsjeOhrJzf2VO6cG1fKmR
	0pPwvN187Kfd6BIDqpU7YYMS1WzLNDj5L9PEfikP8+vopigiAGJ4F9sTxEdBYsfV
	/C+1Aw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgn3xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 15:16:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B955740047;
	Tue, 20 May 2025 15:14:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 795F3AF993E;
	Tue, 20 May 2025 15:14:03 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:14:02 +0200
Message-ID: <e1bd523b-e7da-41eb-ad1a-a56488c4f0cd@foss.st.com>
Date: Tue, 20 May 2025 15:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] checkpatch: use utf-8 match for spell checking
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Andy Whitcroft
	<apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray
	<dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
	<clement.leger@bootlin.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
 <20240102161038.22347-1-antonio.borneo@foss.st.com>
 <02e9e9c5-449a-48ae-88a7-0483895cd4bf@foss.st.com>
Content-Language: en-US
In-Reply-To: <02e9e9c5-449a-48ae-88a7-0483895cd4bf@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01

On 5/6/24 14:07, Clement LE GOFFIC wrote:
> Hello,
> 
> A gentle reminder to review this patch.
> 
> Best regards,
> 
> Clément
> 
> On 1/2/24 17:10, Antonio Borneo wrote:
>> The current code that checks for misspelling verifies, in a more
>> complex regex, if $rawline matches [^\w]($misspellings)[^\w]
>>
>> Being $rawline a byte-string, a utf-8 character in $rawline can
>> match the non-word-char [^\w].
>> E.g.:
>>     ./scripts/checkpatch.pl --git 81c2f059ab9
>>     WARNING: 'ment' may be misspelled - perhaps 'meant'?
>>     #36: FILE: MAINTAINERS:14360:
>>     +M:     Clément Léger <clement.leger@bootlin.com>
>>                 ^^^^
>>
>> Use a utf-8 version of $rawline for spell checking.
>>
>> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
>> Reported-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>> Changes in v2:
>> - use $rawline_utf8 also in the while-loop's body;
>> - fix path of checkpatch in the commit message.
>> ---
>>   scripts/checkpatch.pl | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 25fdb7fda112..2d122d232c6d 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3477,9 +3477,10 @@ sub process {
>>   # Check for various typo / spelling mistakes
>>           if (defined($misspellings) &&
>>               ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
>> -            while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?: 
>> [^\w\-'`]|$)/gi) {
>> +            my $rawline_utf8 = decode("utf8", $rawline);
>> +            while ($rawline_utf8 =~ /(?:^|[^\w\-'`])($misspellings) 
>> (?:[^\w\-'`]|$)/gi) {
>>                   my $typo = $1;
>> -                my $blank = copy_spacing($rawline);
>> +                my $blank = copy_spacing($rawline_utf8);
>>                   my $ptr = substr($blank, 0, $-[1]) . "^" x 
>> length($typo);
>>                   my $hereptr = "$hereline$ptr\n";
>>                   my $typo_fix = $spelling_fix{lc($typo)};
>>
>> base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86

Hi,

Is it just due to -ENOTIME for the maintainers, or are there doubts 
about this patch? (inspired from a response of Uwe).

Clément
