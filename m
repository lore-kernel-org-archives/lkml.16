Received: from email.devuan.org (polpo.devuan.org [65.21.79.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC62101E6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.79.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816191; cv=none; b=ju5suyAUdueaTf6VWdHz63UN3SQt7JsAHIzR1AXLHc1QFKiszCr3JvhE2KIbRXL9Iu3GB39buXkIO89lqsAbjzNj1zmT/UOy5emKZwN/SWPvQZjwNyv5+jiYOokBtz02Snl7pSzQ0vjepbtP7POGoAP3CQjIMUifZG4TZgMfv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816191; c=relaxed/simple;
	bh=/JMBen9fhoFqQaivjQ7HgEwBRd7lz6FFv15uUqO4ee0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=cNkHuTGJ0mti6amSakEra0d93a/9K2kmi9eDpaQxNLSSW4y5uy9BhcsT5XjHn79c0CQcpb7lGSF184ueh54CV5RiYJfuQb5spMoD7+BQJnvLOfWc1YzH6skIeReoYMz9swI9erjQ7qnDz/szgPFNJJmzMAzBmJKC+xEJwiRzXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org; spf=pass smtp.mailfrom=devuan.org; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=Jrepk+CO; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=pISWYtMo; arc=none smtp.client-ip=65.21.79.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="Jrepk+CO";
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="pISWYtMo"
Received: by email.devuan.org (Postfix, from userid 109)
	id 43E3A46B; Fri,  9 May 2025 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746815764;
	bh=/JMBen9fhoFqQaivjQ7HgEwBRd7lz6FFv15uUqO4ee0=;
	h=Subject:From:To:Cc:Date:From;
	b=Jrepk+COpsMdjj+w/1DXokeqtd7GLXL5W/GQFyOftj1quh3fnrhwa9qKV3NUQ8qX6
	 zDjgEDIzesdyyh+PPoLC3Mas9CJZYTos1EfzqPbI1q3Z+U9fSSg1iETR99Bgpuw5SM
	 X+tpMIfAW74SSNOZ+1TrOR4g23rj1T+ACHqak0GYDeu80JgcIXp73NCa0p++1OmXqk
	 O9SrOhogeSC9t7CV5Xt679xMiUq6MZwLm9WVgu/7bT8coRrQatjBbvelp+hLJ2OVsS
	 0bd/SJfPTCJc25cG7fNKLmDIADcYO5yzljjaj1kiOnyGwC3PKNwwWIHgX7jKnILzbP
	 bTd/yIgZANAHg==
X-Spam-Level: 
Received: from [10.14.5.250] (office.ipacct.com [195.85.215.8])
	by email.devuan.org (Postfix) with ESMTPSA id 5F1F83FA;
	Fri,  9 May 2025 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746815760;
	bh=/JMBen9fhoFqQaivjQ7HgEwBRd7lz6FFv15uUqO4ee0=;
	h=Subject:From:To:Cc:Date:From;
	b=pISWYtMot3FQ2zgWtTirZPBq3Q80uI5IhIStedQd4Wy0H6zdHcR+GJTxzwd79xVLg
	 wYTvb9/nzG9NWPHRnSkUc6TxmNUX2tRjIXfjPkKEPqmdMGFj+kgDg1psMfh9lbVOzc
	 kjOKrtU5b9E7ePONqw/4OiAQ353ZOgg0ResaTGYnhOLZSpyGXFoDbWEY/vA2THKob/
	 spcUAbyvQc+FbeCtw///raQ8IqGlO/CKKdm6x+TSzT1rrQL7GPB6GsJPrqFK3i1/Jc
	 6HPi0gjxyFx/p9WkNZq0Ui4+ol5Q9tRfW0yYbv9bCrjfnnaGLLxTrBMC6WEueoiNFX
	 GI0jmuHblgO0Q==
Message-ID: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
Subject: Bug 220102 - struct taskstats breaks backward compatibility since
 version 15
From: Boian Bonev <bbonev@devuan.org>
To: linux-kernel@vger.kernel.org
Cc: Balbir Singh <bsingharora@gmail.com>, Yang Yang
 <yang.yang29@zte.com.cn>,  Wang Yaxin <wang.yaxin@zte.com.cn>, Kun Jiang
 <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>,  Andrew Morton
 <akpm@linux-foundation.org>
Date: Fri, 09 May 2025 21:35:59 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello!

Since version 15 (TASKSTATS_VERSION=3D15) the new layout of the structure
adds fields in the middle of the structure, rendering all old software
incompatible with newer kernels and software compiled against the new
kernel headers incompatible with older kernels.

I think that change has to be reverted and the added fields moved to
the end of the structure. Also bumping the version to 16 after the
change is a good idea in order for the userspace software to be able to
distinguish the different formats.

https://bugzilla.kernel.org/show_bug.cgi?id=3D220102

With best regards,
b.
