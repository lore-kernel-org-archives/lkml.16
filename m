Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262719DF8D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553802; cv=none; b=anWq4EH9RE3RwQV+Y/wFijhOnhRY2n7oyw7bP3/0E7hfb4SmMq/1GBIerlRPqVr0bEo376W0auAPz6YCY5U3lx3h5uElAZnufgLDYtzdVEPvh+5H1aKd7i5Q+9cW3zz8FepmTH4+GdeZDXWMYGyNQ2g9WeUe7ZlGJWkSn9DRoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553802; c=relaxed/simple;
	bh=tulPjPj80MjMXdoJ8Xd94FDUk1wB9cD5VtjcRJ5Mw2o=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ufkByBPnilsTzLbYdO+RvZb5tQkZfR1mmg9bZxXpIqAixrDTdMAEPm6IveH56KzVpOv8qI4dLvcztKpLU5mmJ16QG10xvkkDDaYlMmHWSq00OKB78h2A4yitXiqGRUElPYROP9e+WtOi0eBkKVWYWMawN/FLysF9Z5cA7d9BbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=lOUxEQ7A; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="lOUxEQ7A"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774193fdffso7547231cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1746553799; x=1747158599; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGTmzOB1oSO0r6+w67t8pH/xLYGZWvznpYmLdNMjDCc=;
        b=lOUxEQ7AKBjVJNJUmp/cRtvd9VkCS94Vb3a8qONOIOLqmMXZJFRy0hHvztx07NefC2
         QZf3sB54KZzUMIxle2y8eKxIs9WZ7tXxINkQPNOohSRT3jfCx0ensiu83eYqu1XdJJG1
         ap0y9aeuwW+iWYKLhiK/e+q8X5z/xfOlnFei8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746553799; x=1747158599;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGTmzOB1oSO0r6+w67t8pH/xLYGZWvznpYmLdNMjDCc=;
        b=Z8OLRm4TJ7akDjQIG3/Tg18wDZ8WN2sZJybiN9AFTdsB8gVh6EhMejiW0qMQWmxyJ+
         Nri+YDjzqOyKz5A5WVXYR9fq42MyY7QuTqG1kxroGBWKHgiVwocWI/XbO/TUm19Ku6/x
         kehIyQUHkn5pk96rJTEqm7keBX4wQhMwUeOX01iQtr18DfnJA3Zfee2dG4+A24tgV4fl
         eh2xiOqLdtB9ft2uZrbtbaRcHksTio+7ytNytZLZ7HOcs1KUhR7CJT9/+Ui102uC41xz
         QF9hepXmOqjfqWKGrcRHnBpmGpEGiARJKj61a5W6goGHRletTluufeSGSxgHApkTJivl
         1/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjdFtEOm/9Av5VbBbpXPktVyOjK5oULh3t6NBx0NI4go8kq2TrN4OZE5ehEbxfMICk+cUiMthW5LZ9s+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKNByJ3lGaMa4rlpbTgcNUZCOLs5gTQ3Ivyh5x38e3bQ5V3qf
	3c77hgJ7Svhafw+fNCixdy5qi43jBVZaqD8JNnVVf5FIdyc948Zi1VFqIS5SPBc=
X-Gm-Gg: ASbGnct2DK08+xS/bg3TxNp+HNT6Gel+KZtnVtkxdItOtkcUx8tpiUzfIZxqlIP+Di8
	3UACLarNb2WO/VrcKWNdyuaAy98EOx71OkxGYN6igxzQJlztBMaD42UBYSc4a6/OP4V8K6mN7A0
	0U0W/LS6DRcUl1mD50nOerT4XWfISFBfRBOq9iDayV5vBRYQegfDaE6xv2rgM90z5VN0gc0Pnm+
	4ZxmpzMMzVzkRbyz7VwZhOJ/MR0RGb85LB1G5yqUWHDcOGPWc4JJgUguI9lFeJKk+yyXUtSmad3
	qnkmU5IZm7qE9a9dOVgnaDLEe/bdJRrQ87E1b98VBNmy6dtiAMDRAntABjk=
X-Google-Smtp-Source: AGHT+IETZ2Wim7BOEcdgPT25dtayviIChpwIJA6V9k8V6Vkf0kFnWST5QMWanOJg/f73MseH5XKdOg==
X-Received: by 2002:a05:622a:1b8e:b0:478:f00e:eed5 with SMTP id d75a77b69052e-4922786604emr384161cf.48.1746553798729;
        Tue, 06 May 2025 10:49:58 -0700 (PDT)
Received: from smtpclient.apple ([71.51.182.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49223457cf6sm348481cf.67.2025.05.06.10.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:49:58 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rcu/nocb: Add Safe checks for access offloaded rdp
Date: Tue, 6 May 2025 13:49:47 -0400
Message-Id: <BC3AD2C0-E78E-4512-BC9A-1454FB13E0F6@joelfernandes.org>
References: <CALm+0cUuze+CWJ2YS3TGeyayxBqO-pZbK=dq0E_7rfT+Od3KHQ@mail.gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Frederic Weisbecker <frederic@kernel.org>, paulmck@kernel.org,
 neeraj.upadhyay@kernel.org, urezki@gmail.com, boqun.feng@gmail.com,
 rcu@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CALm+0cUuze+CWJ2YS3TGeyayxBqO-pZbK=dq0E_7rfT+Od3KHQ@mail.gmail.com>
To: qiang Z <qiang.zhang1211@gmail.com>
X-Mailer: iPhone Mail (22E252)



> On May 6, 2025, at 2:26=E2=80=AFAM, Z qiang <qiang.zhang1211@gmail.com> wr=
ote:
>=20
> =EF=BB=BF
>>=20
>>=20
>>=20
>>=20
>>> On 4/30/2025 12:14 PM, Joel Fernandes wrote:
>>>=20
>>>=20
>>> On 4/30/2025 10:57 AM, Z qiang wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 4/28/2025 6:59 AM, Z qiang wrote:
>>>>>>>=20
>>>>>>> Le Mon, Apr 28, 2025 at 05:54:03PM +0800, Zqiang a =C3=A9crit :
>>>>>>>> For Preempt-RT kernel, when enable CONFIG_PROVE_RCU Kconfig,
>>>>>>>> disable local bh in rcuc kthreads will not affect preempt_count(),
>>>>>>>> this resulted in the following splat:
>>>>>>>>=20
>>>>>>>> WARNING: suspicious RCU usage
>>>>>>>> kernel/rcu/tree_plugin.h:36 Unsafe read of RCU_NOCB offloaded state=
!
>>>>>>>> stack backtrace:
>>>>>>>> CPU: 0 UID: 0 PID: 22 Comm: rcuc/0
>>>>>>>> Call Trace:
>>>>>>>> [    0.407907]  <TASK>
>>>>>>>> [    0.407910]  dump_stack_lvl+0xbb/0xd0
>>>>>>>> [    0.407917]  dump_stack+0x14/0x20
>>>>>>>> [    0.407920]  lockdep_rcu_suspicious+0x133/0x210
>>>>>>>> [    0.407932]  rcu_rdp_is_offloaded+0x1c3/0x270
>>>>>>>> [    0.407939]  rcu_core+0x471/0x900
>>>>>>>> [    0.407942]  ? lockdep_hardirqs_on+0xd5/0x160
>>>>>>>> [    0.407954]  rcu_cpu_kthread+0x25f/0x870
>>>>>>>> [    0.407959]  ? __pfx_rcu_cpu_kthread+0x10/0x10
>>>>>>>> [    0.407966]  smpboot_thread_fn+0x34c/0xa50
>>>>>>>> [    0.407970]  ? trace_preempt_on+0x54/0x120
>>>>>>>> [    0.407977]  ? __pfx_smpboot_thread_fn+0x10/0x10
>>>>>>>> [    0.407982]  kthread+0x40e/0x840
>>>>>>>> [    0.407990]  ? __pfx_kthread+0x10/0x10
>>>>>>>> [    0.407994]  ? rt_spin_unlock+0x4e/0xb0
>>>>>>>> [    0.407997]  ? rt_spin_unlock+0x4e/0xb0
>>>>>>>> [    0.408000]  ? __pfx_kthread+0x10/0x10
>>>>>>>> [    0.408006]  ? __pfx_kthread+0x10/0x10
>>>>>>>> [    0.408011]  ret_from_fork+0x40/0x70
>>>>>>>> [    0.408013]  ? __pfx_kthread+0x10/0x10
>>>>>>>> [    0.408018]  ret_from_fork_asm+0x1a/0x30
>>>>>>>> [    0.408042]  </TASK>
>>>>>>>>=20
>>>>>>>> Currently, triggering an rdp offloaded state change need the
>>>>>>>> corresponding rdp's CPU goes offline, and at this time the rcuc
>>>>>>>> kthreads has already in parking state. this means the corresponding=

>>>>>>>> rcuc kthreads can safely read offloaded state of rdp while it's
>>>>>>>> corresponding cpu is online.
>>>>>>>>=20
>>>>>>>> This commit therefore add rdp->rcu_cpu_kthread_task check for
>>>>>>>> Preempt-RT kernels.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Zqiang <qiang.zhang1211@gmail.com>
>>>>>>>> ---
>>>>>>>> kernel/rcu/tree_plugin.h | 4 +++-
>>>>>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>=20
>>>>>>>> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
>>>>>>>> index 003e549f6514..fe728eded36e 100644
>>>>>>>> --- a/kernel/rcu/tree_plugin.h
>>>>>>>> +++ b/kernel/rcu/tree_plugin.h
>>>>>>>> @@ -31,7 +31,9 @@ static bool rcu_rdp_is_offloaded(struct rcu_data *=
rdp)
>>>>>>>>                lockdep_is_held(&rcu_state.nocb_mutex) ||
>>>>>>>>                (!(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible()=
) &&
>>>>>>>>                 rdp =3D=3D this_cpu_ptr(&rcu_data)) ||
>>>>>>>> -               rcu_current_is_nocb_kthread(rdp)),
>>>>>>>> +               rcu_current_is_nocb_kthread(rdp) ||
>>>>>>>> +               (IS_ENABLED(CONFIG_PREEMPT_RT) &&
>>>>>>>> +                current =3D=3D rdp->rcu_cpu_kthread_task)),
>>>>>>>=20
>>>>>>> Isn't it safe also on !CONFIG_PREEMPT_RT ?
>>>>>>=20
>>>>>> For !CONFIG_PREEMPT_RT and  in rcuc kthreads, it's also safe,
>>>>>> but the following check will passed :
>>>>>>=20
>>>>>> (!(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible()) &&
>>>>>>          rdp =3D=3D this_cpu_ptr(&rcu_data))
>>>>>=20
>>>>> I think the fact that it already passes for !PREEMPT_RT does not matte=
r, because
>>>>> it simplifies the code so drop the PREEMPT_RT check?
>>>>>=20
>>>>> Or will softirq_count() not work? It appears to have special casing fo=
r
>>>>> PREEMPT_RT's local_bh_disable():
>>>>>=20
>>>>> (   ( !(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible()) || softirq_=
count() )
>>>>>   && rdp =3D=3D this_cpu_ptr(&rcu_data))  )
>>>>=20
>>>> Thank you for Joel's reply,  I also willing to accept such
>>>> modifications and resend :) .
>>> Thanks, I am Ok with either approach whichever you and Frederic together=
 decide.
>>> I can then pull this in for the v6.16 merge window once you resend, than=
ks!
>>>=20
>>=20
>> Frederic, there are a couple of ways we can move forward hear. Does the
>> softirq_count() approach sound good to you? If yes, I can fixup the patch=
 myself.
>=20
> Hello, Joel
>=20
> If you send a patch to fix it, I'd be happy,  you can add me as the
> Reported-by ;)

Actually Z, could you send the patch with the suggestion above after appropr=
iate testing? That way I will be more comfortable applying it for 6.16.

Sorry for any confusion,=20

Thanks!

- Joel


>=20
> Thanks
> Zqiang
>=20
>>=20
>> I am also Ok at this point to take it in for 6.16, though I've also store=
d it in
>> my rcu/dev branch for Neeraj's 6.17 PR, just in case :)
>>=20
>> - Joel
>>=20
>>=20
