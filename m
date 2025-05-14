Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456628EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187475; cv=none; b=s8oxOLQAvU1o1OQp2+b5oxS6c+flKGODcpySZaYPy7vW8+kYiBrcPM+cg5TTZsmQouTF7D9GpfRnY33bT8kIH0EGHozqn/XIRJdgJHvnGGRBr4gyblcR0oJTBDwb1bwLJRIvyUzBCRr/N1ImyGHhKMzqu+/u0V/wxKX4V7w00QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187475; c=relaxed/simple;
	bh=pneGe9E32qzAe57x0JouquSD6m4G4zHBQGrmGVMjYBs=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Yb13Qb0YjGR1b6Y6o0BbrETG/cRdzqJ0XcjQrrRcJ59mpe/uSqRijzlFgSNb/iHmBI5T+Od+M7wh1okngfQA/t6OXf5RVRzLtIpu69/WYpzAFRiE6S2u2FDD8kZESA2cf9Zx4IZXE0dQDbHp56SS/qsaWH3+GnraXK5owCDIV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZxxBs4Mcwz8QrkZ;
	Wed, 14 May 2025 09:51:01 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 54E1ouZe063330;
	Wed, 14 May 2025 09:50:56 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 14 May 2025 09:50:57 +0800 (CST)
Date: Wed, 14 May 2025 09:50:57 +0800 (CST)
X-Zmail-TransId: 2af96823f701ffffffff946-d9e49
X-Mailer: Zmail v1.0
Message-ID: <202505140950573489NhOV97K3BT0-xew40vNy@zte.com.cn>
In-Reply-To: <561581d5-4f29-4e23-b543-09960118da9c@lucifer.local>
References: 20250513161758.136402-1-lorenzo.stoakes@oracle.com,dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com,783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local,ae22b0df-f4ab-4567-b3b4-35c1c6b5233a@redhat.com,561581d5-4f29-4e23-b543-09960118da9c@lucifer.local
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <lorenzo.stoakes@oracle.com>
Cc: <david@redhat.com>, <akpm@linux-foundation.org>,
        <chengming.zhou@linux.dev>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <jiang.xuexin@zte.com.cn>, <Liu.Jianjun3@zte.com.cn>
Subject: =?UTF-8?B?562U5aSNOiBbUkZDIFBBVENIXSBNQUlOVEFJTkVSUzogYWRkIG1tIGtzbSBzZWN0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54E1ouZe063330
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6823F705.000/4ZxxBs4Mcwz8QrkZ

> > I guess my point is, as a submitter you expect that people that are listed
> > under R: that you are supposed to CC would actually ... review? :D
> >
> 
> Yeah of course, kinda makes sense right?
>
> > In that case, I would prefer to have actual reviewers there. If there are
> > none, then there should be none listed.
> >
> > Of course, If Xu and Chengming do *want* to actively review KSM code
> > changes, I would be more than happy to list them.
> 
> Sure, so I think best thing is to ask:
> 
> Xu, Chengming - do you WANT to be reviewers here? :) if not, happy to drop.


Sure,  I am more than willing to take on the role of reviewer for the KSM module.
I am pleasured to dedicating my time to reviewing new patches about KSM on the
mailing list. Thank you for the invitation.

Cheers, Xu

>
> I could add myself as a reviewer as a backup option in case you need review
> also guys, though KSM is really not my area but I can approach from first
> principles at least.
>
> Cheers, Lorenzo
