Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E79295DBA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750200771; cv=none; b=LQIFddHXeR+/BLCMEiVNdIy3Jo0iqyk9FVhq/RkjIsPjl72FPxaE3n4NbfoXEEOBnYRnAlx49YmRoh/qLb4zwHNM2MyBSROKoPDoJkojwPD9XZdpdVFpZlOvgwNR7mEG4Fv2NKTahI6Ti58jrFsGbJBmAh9pTKRg+fnGfQGcG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750200771; c=relaxed/simple;
	bh=A0ZxN9aZ5KdP0dwFmuWSkqKp5m+dIkABM5Qg/UoFprs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=nGSgHDamJinLdheD9QrIL0la6Cz3LKOZafSlIMXeQXijM02/MUdwYAz4AHrEzr8+wbHu1IC9Du9evkS7RYYSSI6EW7tNE35eFSx0QGi8YPRQidAUs5o7sR2PMyNN38ZwVw+eKYfYVgkpVXG/TX+sLKxyAH51EAR7v+owoKusCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space; spf=pass smtp.mailfrom=elijahs.space; dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b=KBN2S6J3; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Em0VfFx5; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elijahs.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b="KBN2S6J3";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Em0VfFx5"
DKIM-Signature: a=rsa-sha256; b=KBN2S6J3FfQ02LL+cDATLQtsENXBtZzsjiiVnFofZ3sS/vqCuzXvYoFOAnE1peGIMosoQDZzmENhiU0qU55Q+CuTeDTmsGOTPedN+uZIRNwEbTjsc9cTK5ATW5HSzuWsADxTgsuq5iesC7SxAGh5TXgVPDtM53twC2ASz1tGGm0PQRmC0Mdo3nZEmWF8DvwiKttqD13qgzvGgH0T68JRaL83i3rgtUww8vURca5gquG13NQ0a8scqnhni6zRghkHzawlBDJjslCF2VGNvvR59RkOmHE9dTXt3iWK2cGj4VHLYT75gC4drTla7PsaFaHae1AOgONhc141KkXkKvgRbg==; s=purelymail3; d=elijahs.space; v=1; bh=A0ZxN9aZ5KdP0dwFmuWSkqKp5m+dIkABM5Qg/UoFprs=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=Em0VfFx5rItcOwhidEMJKTId6c8XgJMxS/rC92O03l6t7gKrgIqxSLhJYGcobmmi4X5NrUBjJPMi/m6sODoTKFlQq16UkUyJaVb+8YOiHhnPgdWGzRRrw51rcqhn95YTRUizVf6WfNi91YN4TuzFiFaQylcuHHV+IQWsST0FHD6NtKxMGyU546127OCYfMRN8Stb7/A40teZ0gy+fewSp54tj3de7w70GW7t+uEQEnMHYtUyB++QrekD1Sx50cP/OOD1iNsADfVkZtpcxj9zM45fGOn8g5+92j1NBUSeIuNJL8gHvJBHtXd3JuE2EUL/JuylnV9NP1CbB4AVErzJrQ==; s=purelymail3; d=purelymail.com; v=1; bh=A0ZxN9aZ5KdP0dwFmuWSkqKp5m+dIkABM5Qg/UoFprs=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 147366:4866:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -738148538;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Jun 2025 22:52:30 +0000 (UTC)
Message-ID: <b2644203-b1cd-4bc9-9afe-bd0ae0390ae4@elijahs.space>
Date: Tue, 17 Jun 2025 15:52:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: mq-deadline: check if elevator is attached to
 queue in dd_finish_request
To: Bart Van Assche <bvanassche@acm.org>
References: <20250617205630.207696-1-git@elijahs.space>
 <1e25d17b-f481-485c-85a6-d5a8440c1c96@acm.org>
Content-Language: en-US
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
From: Elijah Wright <git@elijahs.space>
In-Reply-To: <1e25d17b-f481-485c-85a6-d5a8440c1c96@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

I see. would it be possible to detach the elevator from the queue in=20
elevator_exit instead?

On 6/17/2025 3:25 PM, Bart Van Assche wrote:
> On 6/17/25 1:56 PM, Elijah Wright wrote:
>> in dd_finish_request(), per_prio points to a rq->elv.priv[0], which=20
>> could be
>> free memory if an in-flight requests completes after its associated=20
>> scheduler
>> has been freed
>>
>> Signed-off-by: Elijah Wright <git@elijahs.space>
>> ---
>> =C2=A0 block/mq-deadline.c | 16 +++++++++-------
>> =C2=A0 1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/block/mq-deadline.c b/block/mq-deadline.c
>> index 2edf1cac06d5..4d7b21b144d3 100644
>> --- a/block/mq-deadline.c
>> +++ b/block/mq-deadline.c
>> @@ -751,13 +751,15 @@ static void dd_finish_request(struct request *rq)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dd_per_prio *per_prio =3D rq->elv.=
priv[0];
>> -=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The block layer core may call dd_finish_requ=
est() without having
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * called dd_insert_requests(). Skip requests t=
hat bypassed I/O
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * scheduling. See also blk_mq_request_bypass_i=
nsert().
>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 if (per_prio)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc(&per_prio->stats.=
completed);
>> +=C2=A0=C2=A0=C2=A0 if (rq->q->elevator) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The block layer core may c=
all dd_finish_request() without=20
>> having
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * called dd_insert_requests(=
). Skip requests that bypassed I/O
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * scheduling. See also blk_m=
q_request_bypass_insert().
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (per_prio)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atom=
ic_inc(&per_prio->stats.completed);
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>=20
> The warnings in dd_exit_sched() will be triggered if dd_finish_request()
> is ever called with rq->q->elevator =3D=3D NULL.
>=20
> If this can happen, it should be fixed in the block layer core instead
> of in the mq-deadline scheduler.
>=20
> Thanks,
>=20
> Bart.

