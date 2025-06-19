Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED21D6187
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342725; cv=none; b=LaZoFM5fUEoxuHfPgtTxTcFQKgE6632SBrBMX0JfL+aSeo+OBS5nDnsjm20GdbZsud7LMHnxFNfLtWfXnTn6+OQ20hzB5avEsG9Hk35URTDfaqdxClm63z0t1LcEcafTqXPQHdsOGbRVjrMeQlwlisCvGXSCY+PHE1apAzxx3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342725; c=relaxed/simple;
	bh=H6wzggDRhxLgF/k7QgwWzPPiwJmYOU2J3mhjqhSXHk0=;
	h=Message-ID:Content-Type:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:References:To; b=URw3QRCVudVOSkpL+wrXpgkBfvAwgXQpqfwNNrLQU8vfJsVQWD363Ed0X8SmVxfLiCHki7IrwaHmaped1IuYbbNUIPwQj4qEoJRoVnnsnxkxj9Bs/NiyWID3zMZvfpjqrVWeyCGL0ALIbPDx0vEgyDgb3zp4F84/0CnLchvx5PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OOpYVzch; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OOpYVzch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750342704; bh=jEPNTd2WPyoDSyTpEMpP/zxHOT0uryc9RD50UhZr78A=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=OOpYVzchjatZ/O42Rtt15I/wzUYV2xm35DqhbM0nL/Q5aNbB676VqIQjGTvfkNK0Y
	 VADggGJM9pOxtTTvkB7dIVg81kp4S7AnZQSbh9T9MeOjrzDhEqgqLc5N1NK3JSCTNM
	 4a5eaprowaJvaOgIa+44jAySdfewgguF3QQZ/dsA=
Received: from smtpclient.apple ([2408:8207:18a2:f420:88c5:a3d0:e224:94b2])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 30E27000; Thu, 19 Jun 2025 22:12:14 +0800
X-QQ-mid: xmsmtpt1750342334t1qpkrhkq
Message-ID: <tencent_6FC67FBE2D41106D17474BDCC318C1909D07@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9tZ/1rpJ6YURlDIRkqdSvQg6OqWDrVF/QvBWs51cGg0ant9754D
	 mfznjollGXuxngwjuCxHkY19DV3Tl/S1vWXh5KI+Sw7OT2F5M/T55boe0d8qQrGXKNaGxP9HFlav
	 QpC72Wx2QuZWjerGpykqJOKoV/gQISXf0Vle1EwpBziKrZE07RQQhNgYkZTDd94W90jm2ErV2kyH
	 XHG82e1hFnkY1mnXWJOSzf6RO3kfTysuv8gHrIUPklnHR0AyACRmS/22vvL4BgJevC5Uuv999bLJ
	 0C4wNNQfhd6AOl76BReXNvzhZa0lEbvHDNXeSGl4Y839oWBYSA6qLaqhA217SrrH/bR8ajsv0Cfo
	 3ltr9lo2cg87GP5PQr4b7lCtTtbNjQqd5gS6sIgC+xophVxNDdAY3P6KsK4ulvxQsd4akjm8/XBU
	 oQfCcDaMu64dN5D3QzcegZerXmJGkU7iDlFR1LWhQOkEBUZufR3WdXKLl6/rLTF8Rm6XS/4B/cqv
	 On3Vf975oRFlxuII/vWlr/2JVKvWfBf1DQ/HLqN7YPqrBrN1m58qUEKgWOGvWawK5AkckJUvpxJ0
	 w1m/Shq4PaKqIvH1qLK4aU8S4ZKwqxgNoqoQ6jA07E9TzJBIbawDl5ePHvftMx/8zWBvfF3frKhl
	 TTsn85QVwSuntUBK0zOwsPC0znbE+tCjioEo82t4hQl9V2rLkv0bdw2UzsxzVB9oAFhXTeogXGNJ
	 rfbmyCsiuYUhVNEJySMAlf8e9bDCEDuHUepP+PD6Vt6lc+/zbqu1fV6dm5oWVq11/ckuWhSfcPVY
	 ryXZlOcngbtrzKDHAqDF+yTit9fPIcfI2BGZFXMQTHt79VvDX3I/25Rn3iX0rROGlmQXcfBI4+b2
	 f3OAbrjaSw/wPzlT32AhFdJHCW1+mcGL3nf86vcTE7q6ffdhTktEP/LBBQmKlbt/N6kzBmurUb9l
	 X4Xq1/u2K709dIixd3+QIAiQ+WF/6XNlnr/maF1V8Ks7KxxfJCfPv664MKRUbPp5e/Q+D858b5Cc
	 /0CkhtnR76AD4Zs8YrV2TYat+WiqA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <9dbdfec2-0a2d-4110-b8ef-b9d16900ff87@intel.com>
Date: Thu, 19 Jun 2025 22:12:03 +0800
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>,
 Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <879A5558-B722-4FC4-880E-C0DA303912D4@cyyself.name>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <tencent_6E51A3175F8AE0A7F684A319EE63CC56C806@qq.com>
 <9dbdfec2-0a2d-4110-b8ef-b9d16900ff87@intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On 19 Jun 2025, at 21:21, Chen, Yu C <yu.c.chen@intel.com> wrote:
> 
> On 6/19/2025 2:39 PM, Yangyu Chen wrote:
>> Nice work!
>> I've tested your patch based on commit fb4d33ab452e and found it
>> incredibly helpful for Verilator with large RTL simulations like
>> XiangShan [1] on AMD EPYC Geona.
>> I've created a simple benchmark [2] using a static build of an
>> 8-thread Verilator of XiangShan. Simply clone the repository and
>> run `make run`.
>> In a static allocated 8-CCX KVM (with a total of 128 vCPUs) on EPYC
>> 9T24, before the patch, we have a simulation time of 49.348ms. This
>> was because each thread was distributed across every CCX, resulting
>> in extremely high core-to-core latency. However, after applying the
>> patch, the entire 8-thread Verilator is allocated to a single CCX.
>> Consequently, the simulation time was reduced to 24.196ms, which
>> is a remarkable 2.03x faster than before. We don't need numactl
>> anymore!
>> [1] https://github.com/OpenXiangShan/XiangShan
>> [2] https://github.com/cyyself/chacha20-xiangshan
>> Tested-by: Yangyu Chen <cyy@cyyself.name>
> 
> Thanks Yangyu for your test. May I know if these 8-threads have any
> data sharing with each other, or each thread has their dedicated
> data? Or, there is 1 main thread, the other 7 threads do the
> chacha20 rotate and put the result to the main thread?

Ah, I had forgotten to mention the benchmark. The workload is not
about chacha20 itself. This benchmark utilizes a RTL-level simulator
[1] that runs an Open Source OoO CPU core called XiangShan [2]. The
chacha20 algorithm is executed on the guest CPU within this simulator.

The verilator partitions a large RTL design into multiple blocks
of functions and distributes them to each thread. These signals
require synchronization every guest cycle, and synchronization is
also necessary when a dependency exists. Given that we have
approximately 5K guest cycles per second, there is a significant
amount of data that needs to be transferred between each thread.
If there are signal dependencies, this could lead to latency-bound
performance.

[1] https://github.com/verilator/verilator
[2] https://github.com/OpenXiangShan/XiangShan

Thanks,
Yangyu Chen

> Anyway I tested it on a Xeon EMR with turbo-disabled and saw ~20%
> reduction in the total time.

Nice result!

> 
> Thanks,
> Chenyu


