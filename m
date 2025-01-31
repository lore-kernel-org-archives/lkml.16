Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE7165F1D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738364981; cv=none; b=VKtK34+CJzXJptrHQdcCvwHsKNJyhAhkNGytuMEbmyiuheE4GhEEPLoS0lrrs7KYyaxzak8f/Z7M0Sb8pe7T/KcCVXskJkk/0HNeTu1RjE5JkiKG48ScfYmxC3yxBBFsCjRQvRQtBWNxfq+amSWWHPNSyU9gS/IhXw18LG7/11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738364981; c=relaxed/simple;
	bh=k0hpYp+vMZYyQsjhTP6gRA+YBINF4ZRFrpoe+Bcn5sg=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=Vd4TzB7iYAl/jwJQMpQDTt27GRb/ar7X4Jy4UU/u/hm8DCHiwPQInPyAmkFSHpFxRXy88HMWH4uy0WYsNCbN7wnESQxmUpXTn3+GPdmyZ2lGZj1/NCHuhSYGZHf71RQdvmY16IP4jruCrgMET1ihycqyl1pfMojbdrCxZfVgRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:44162)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1te08o-00B30L-ME; Fri, 31 Jan 2025 16:09:38 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:46716 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1te08n-009VU4-LX; Fri, 31 Jan 2025 16:09:38 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: brauner@kernel.org,  oleg@redhat.com,  akpm@linux-foundation.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
References: <20250128160743.3142544-1-mjguzik@gmail.com>
	<87ikpubt4c.fsf@email.froward.int.ebiederm.org>
	<CAGudoHHd3cE6+nyZY3wi5Xw5++uKiypR3qK_3=2XcGNocE4Vyw@mail.gmail.com>
Date: Fri, 31 Jan 2025 17:09:16 -0600
In-Reply-To: <CAGudoHHd3cE6+nyZY3wi5Xw5++uKiypR3qK_3=2XcGNocE4Vyw@mail.gmail.com>
	(Mateusz Guzik's message of "Fri, 31 Jan 2025 23:31:01 +0100")
Message-ID: <8734gybmxv.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-XM-SPF: eid=1te08n-009VU4-LX;;;mid=<8734gybmxv.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19kdD9GOaw2BtZ9qBaamkzRB6szcjh2wn0=
X-Spam-Level: *
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 XM_B_Unicode BODY: Testing for specific types of unicode
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 T_XMDrugObfuBody_08 obfuscated drug references
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Mateusz Guzik <mjguzik@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 449 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 4.4 (1.0%), b_tie_ro: 2.9 (0.7%), parse: 1.12
	(0.2%), extract_message_metadata: 11 (2.5%), get_uri_detail_list: 2.0
	(0.4%), tests_pri_-2000: 11 (2.4%), tests_pri_-1000: 1.80 (0.4%),
	tests_pri_-950: 1.05 (0.2%), tests_pri_-900: 0.78 (0.2%),
	tests_pri_-90: 173 (38.5%), check_bayes: 171 (38.0%), b_tokenize: 5
	(1.1%), b_tok_get_all: 111 (24.8%), b_comp_prob: 2.7 (0.6%),
	b_tok_touch_all: 49 (10.9%), b_finish: 0.83 (0.2%), tests_pri_0: 232
	(51.6%), check_dkim_signature: 0.39 (0.1%), check_dkim_adsp: 3.7
	(0.8%), poll_dns_idle: 1.80 (0.4%), tests_pri_10: 2.6 (0.6%),
	tests_pri_500: 8 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] exit: perform randomness and pid work without
 tasklist_lock
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, oleg@redhat.com, brauner@kernel.org, mjguzik@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Mateusz Guzik <mjguzik@gmail.com> writes:

> On Fri, Jan 31, 2025 at 9:56=E2=80=AFPM Eric W. Biederman <ebiederm@xmiss=
ion.com> wrote:
>> Moving proc_flush_pid inside of tasklist_lock is a bad idea.
>
> The patch does not make such a change though.
>
> The call is still performed without the lock, but it also dodges the
> additional refcount dance (and notably eliminates an atomic from an
> area protected by tasklist_lock).

My mistake I saw you had moved it up, but I had missed just how
far.

It is still a bad idea to move it early, as that has caused problems
with lingering proc entries for reaped task clogging up the dcache.

>> It is wrong that attach_pid/detach_pid can be performed without the
>> tasklist_lock.  There are reasonable guarantees provided by the posix
>> standard that the set of processes sent a signal is the set of
>> processes at a point in time.  The tasklist_lock is how we provide
>> those guarantees currently.
>>
>
> I don't see anything calling these without the lock and neither my
> patch nor a follow up about pids suggest anything of the sort.

No.  You simply said fork called attach_pid without the lock and
your description implied it was safe to call attach_pid/detach_pid
without the lock.

>> There are two more layers to pids.  The pid number allocation of
>> alloc_pid/free_pid, and the struct pid layer maintained by get_pid,
>> put_pid.  Those two layers don't need the tasklist_lock.
>>
>>
>> It is safe to move free_pid out of tasklist_lock.  I am not certain
>> how sane it is.
>>
>
> Where is the sanity problem here? AFAICS this just delays some wakeups
> in the worst case.

At the end of the day it might be a sensible way to go.  I just haven't
found the arguments to convince my gut of that yet.  It is important for
me at least to convince my gut because it usually notices problems
before the rest of me does.

Eric
