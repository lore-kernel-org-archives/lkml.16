Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E58227E8A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064461; cv=none; b=asZ/LqUqZs11ydByGDiq+hEB47DogXnEoIt0jSzMSpWy8lXXADUektDCFKzPc4scECEsTCVKKZXs7EPKYGSXhcO+tOFysXvxbZgCEB6QFWxvjEyl7tPo6Hjn7p7E1B39TAIzNBk6EkVcZK7Dqm/C/flwK5a2IYNjM8fTXEEUYkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064461; c=relaxed/simple;
	bh=eB51KYgQdyr7IwazZ3F+ybay1cyim9/w4WbmWWtX9F8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U+ueKUYip3AWAVEbjc0E2vFSJxG0y+oh3sJndEXxh/JAoYMMhmU5RRac0MSAhsZslHLk7KHF+3qbzs1ZHPc9EqE4gKpFvBaurWYE0IIABDD3o8tG4V2dbrETOSNswp+KZrMl8xJygcl/sEovXBNngdDsq9aabOQ9VrylPS6E15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f64XCK3w; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f64XCK3w"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CDnGbn001327;
	Mon, 12 May 2025 15:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=J+A6k4
	tHqMzx9b4qYee8w4KYIFOoacw1O8+M9svb7xI=; b=f64XCK3wJTu/45P8N18nSV
	sb40aFlBa36I5GVRuhtXw5u4xoT6diTxmq69NlQbGad1FQdhtr9JLrBWSpwDdn8I
	iCu+zm3UA1HwqjtDTqzsuz1XEtJTAaXxafz0XsHclF5Sm3+A0psPj1y2s6xDajPh
	KBxnkFbOHIB5kfaurQ41nShtHcDq/LBjwtCGgT5xVp3rRF/cMjzJmHOFx6mSMWAC
	d0d5SuGzL1jK8GzZFmvJHIy3oFJLv8u9rZRWcv+HuTTxJn6D1hr16Qnd1YMzv3F+
	HgUqbX5Upw76l2E5SAl4eJOJFcOVHfXjXe/OSRkVpmVxdngoEehT0E8US7+Fn4pw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46kj758jth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 15:40:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CFZIdi018983;
	Mon, 12 May 2025 15:40:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46kj758jte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 15:40:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CCfoWw016955;
	Mon, 12 May 2025 15:40:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jhgyxrbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 15:40:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CFeidu44630318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 15:40:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CBF1200C8;
	Mon, 12 May 2025 15:16:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62936200C4;
	Mon, 12 May 2025 15:16:22 +0000 (GMT)
Received: from [9.111.90.223] (unknown [9.111.90.223])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 May 2025 15:16:22 +0000 (GMT)
Message-ID: <a56f71e2-fad3-4777-b774-a43bc6fabcac@linux.ibm.com>
Date: Mon, 12 May 2025 17:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/4] sched/rt: add support for parked CPUs
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
References: <20250512115325.30022-1-huschle@linux.ibm.com>
 <20250512115325.30022-3-huschle@linux.ibm.com>
In-Reply-To: <20250512115325.30022-3-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2MiBTYWx0ZWRfX/b8YtZeWEypV JQoEjfPreK6B4J24z5tl51YdPgq3L2psj6deCQ2kGCfHqvaJeDdWLWa8C1pmz5qdqOZGaAQQkwW a+B5BT2nNr9gIOmJ5iS6Y0z+/BXguYtRPZdXxdortxvryXoaHg+jnjK7MCJr5JwXzADJNna/XEH
 +COTW70zuJG6iem3/DDrckFvljIEeGgNJtMCnZH53WU1dKAlNMK7URuwFYJA/lF1rfugakuKjZn Uha/Y5JnR5xY/oDRtY2WpRccEu1Lj8Spfy/YZwyDVzvAbP/+WLtGHfe+1oWYb9ALywSU0+tHmWd sWB9IZm8IRPoDZLb3WqRpNr74P6xOxNYVPQV6/7qQ0JtULjR35OU69gb+NAHTbY+M9DEF5LNZcT
 DK9OGo3zSmUm1dDef1y0LKcopcL4c5IgMzAYu5DIptSvZ8B3eWudPRrMBX8oAu/jx3McMdyY
X-Authority-Analysis: v=2.4 cv=J4mq7BnS c=1 sm=1 tr=0 ts=6822167f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=IJLY_-R8i5aRopSSRXUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3BvVJ9uvrww0HGBlnGtOMrnr4XwVbzCY
X-Proofpoint-GUID: jsvKRcbJHe4LH6uj5GsCy1mBG_Lpubem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=585 priorityscore=1501
 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120162



On 12/05/2025 13:53, Tobias Huschle wrote:
> Realtime tasks must also react to the parked states of CPUs. Tasks will
> be treated as if the parked CPUs have no free capacity to work on them.
> 
> A dynamic change in the parked state of CPUs is handled correctly if
> realtime tasks do not consume 100% CPU time, without any interruption.
> If a realtime tasks runs without interruption, it will never enter the
> load balancing code and will therefore remain on a CPU, even if the CPU
> becomes classified as parked. Any value below 100% causes the task to
> be migrated off a CPU which has just been classified as parked.
> 
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>

The content of this patch was proposed by Shrikanth, so special thanks 
to him!

<...>

