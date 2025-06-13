Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED518A6DF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828346; cv=none; b=Uomzc/TAqzk9oQrdkcagfBveKbG6GAKSUlEPtzFA8FduPoJyx99Yt9XQEbhN77kbkP5n0TyGj+a+oNHBdIE7fRAv46fCsyoddK5OL/0tHvmQLBVqqnKx9aEPKrGHqX0EKOzZ0vMXYeN4ugTenKCV8wV0p8NN/eQMtGA8hP9ifes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828346; c=relaxed/simple;
	bh=5Qxm/mUOR7cmc6BrDSdpe6P/adHyAhov4VLqzOUjc4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrPtrdZePfY/WJLXbMb1r8BCAqZeeT3Yc2pn2vtcUwfK7ZO3VjUqWUwWzURMkhqojl6waT0ntUSywNN2SbNxtQRJnDFhbteS7Sro3kBSuw8zONS/jwpxFW6o9nVjnIMFgjJQrrM6xb82FgXyTxvnFqQI83XTLFbriAdM5bTwYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 9ADB8120A87;
	Fri, 13 Jun 2025 15:25:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id E8C8220038;
	Fri, 13 Jun 2025 15:25:32 +0000 (UTC)
Date: Fri, 13 Jun 2025 11:25:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: juri.lelli@redhat.com, bsegall@google.com, dietmar.eggemann@arm.com,
 linux-kernel@vger.kernel.org, luca.abeni@santannapisa.it, mgorman@suse.de,
 mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
 vschneid@redhat.com, yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL
 on top of RT
Message-ID: <20250613112531.04cfa8ad@batman.local.home>
In-Reply-To: <20250611135456.61493-1-yurand2000@gmail.com>
References: <aEfwxUyu54Y1EXJI@jlelli-thinkpadt14gen4.remote.csb>
	<20250611135456.61493-1-yurand2000@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E8C8220038
X-Stat-Signature: b863p6t3mr3aiymdfksf5jrzxd73h44z
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1++YD2dBarreGRLQfXg0JX4SQCK0wJYWpk=
X-HE-Tag: 1749828332-630125
X-HE-Meta: U2FsdGVkX1+IoBJY9fUs4RxV2RXZQqXln+frg5L8jeKzAYWCZKEgL+C2I1wSJpA0VzJNtX7st3LcR+xzzfh5U6PhftrrzQkGxbwtY6q1MZKU5oaQVac9nue7UbklB/ymRCnTW/QpOOvFJ5x5XiTKJPsbj3qy5ShGA0McjlclcaH2wNixJmAIH7jpH2yS1D1D9iYkpDikaP4y+10M+cXn/MWzF4xgPwALYu+2tWuEwQQ+LV7oO4UGiBkYRRr2cNMasIAkIIkOaWabjjqyEhZWyvP4KKCak0U4dB8N/DEVZzwpW6p5MQI/TF3HQQTocOAVc3BRe1lPC2GIFwk/7l8KgWUI4zemYSGf

On Wed, 11 Jun 2025 15:54:56 +0200
Yuri Andriaccio <yurand2000@gmail.com> wrote:

> Hi,
> 
> thanks for your feedback.
> 
> > From changelog (and confirmed by changed lines), this patch might be doing too
> > many things at once and so it might be harder to review. Do you think it can
> > be split in smaller chunks?  
> 
> I'm currently working on splitting this patch (and the patch 8) in smaller
> chunks as you suggested, adding changes bit by bit.
> 
> I'll submit the updated version of the patchset for a RFC v2 as soon as I have
> it done.

Hi Yuri,

Thanks for doing this. On your next version, please add your own
Signed-off-by to each patch you send. Although you may not be the
author, you are posting them, which requires a Signed-off-by which
basically is you saying you have the right to post these patches.

Thanks,

-- Steve

