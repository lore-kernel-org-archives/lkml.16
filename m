Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A3A2AE99;
	Sat, 14 Jun 2025 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749883837; cv=none; b=Cb7IGHkvfvMhBJgbFTYCrFnQUw5GDb6N8MsTb1wU/pVNwQ14ZC5g08pNVJa6jElhgWmwpZeNi0/plraQ9glSg5e6wiN/pjJjrHSLcBwi5hp7O313WG0cF767tqQfcNzfGQOMf7z7jFFJeV37fAxS1dErf81S9AwdVKBpoZJ/yWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749883837; c=relaxed/simple;
	bh=b+ZNK9H+MGbconJey2jD2y8seac9nVP4q217lbRq7W4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qa0fvy9ozrM7TPxTmEz5WRZ62e/6CGsN/9CzTrRki1iLSpgC3+kpV6PIrvlb5GwV9uOmZUxEhpqihcE55u+G/O+rhhftav7Gb88WL2rceEIrJo6IBwMyGEM8HLm432hrvvz/Be9XS7l/SJSJ5lTLkaqUONTIwbwNHYeM9zwxn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cz2hnVz9t0K;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzJiJVWnwwT0; Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cz1jFTz9t0H;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 353E18B77B;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rpo6pN8d7mWZ; Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BCE058B769;
	Sat, 14 Jun 2025 08:43:22 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 0/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Sat, 14 Jun 2025 08:43:13 +0200
Message-ID: <cover.1749883041.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883393; l=4713; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=b+ZNK9H+MGbconJey2jD2y8seac9nVP4q217lbRq7W4=; b=LKyYrK0DlNR6aTIHoEmvIpc7BaxFRlaNMYY0kH7LUAkeVzoBPw3szJ7OXhhUT2gm5Q8dXeypn 3cQAAhKIJHODOeBk8pkfFhNys5NCZKJe05ts30wOinxe70bTLJqipIi
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This series converts all variants of SNDRV_PCM_IOCTL_SYNC_PTR to 
user_access_begin/user_access_end() in order to reduce the CPU load
measured in function snd_pcm_ioctl.

With the current implementation, "perf top" reports a high load in
snd_pcm_iotcl(). Most calls to that function are SNDRV_PCM_IOCTL_SYNC_PTR.

    14.20%  test_perf           [.] engine_main
==> 12.86%  [kernel]            [k] snd_pcm_ioctl
    11.91%  [kernel]            [k] finish_task_switch.isra.0
     4.15%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
     4.07%  libc.so.6           [.] __ioctl_time64
     3.58%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     3.37%  [kernel]            [k] sys_ioctl
     2.96%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
     2.73%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     2.58%  [kernel]            [k] system_call_exception
     1.93%  libasound.so.2.0.0  [.] sync_ptr1
     1.85%  libasound.so.2.0.0  [.] snd_pcm_unlock
     1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
     1.83%  libasound.so.2.0.0  [.] bad_pcm_state
     1.68%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.67%  libasound.so.2.0.0  [.] snd_pcm_avail_update

A tentative was done with going via intermediaire structs on stack to
replace the multiple get_user() and put_user() with copy_from_user()
and copy_to_user(). But copy_from_user() calls _copy_from_user() and
copy_to_user() calls _copy_to_user(). Both then call __copy_tofrom_user().
In total it is 16.4% so it is worse than before.

    14.47%  test_perf           [.] engine_main
    12.00%  [kernel]            [k] finish_task_switch.isra.0
==>  8.37%  [kernel]            [k] snd_pcm_ioctl
     5.44%  libc.so.6           [.] __ioctl_time64
     5.03%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
==>  4.86%  [kernel]            [k] __copy_tofrom_user
     4.62%  [kernel]            [k] sys_ioctl
     3.22%  [kernel]            [k] system_call_exception
     2.42%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
     2.31%  [kernel]            [k] fdget
     2.23%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     2.19%  [kernel]            [k] syscall_exit_prepare
     1.92%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.86%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     1.68%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
==>  1.67%  [kernel]            [k] _copy_from_user
     1.66%  libasound.so.2.0.0  [.] bad_pcm_state
==>  1.53%  [kernel]            [k] _copy_to_user
     1.40%  libasound.so.2.0.0  [.] sync_ptr1

With this series which uses unsafe_put_user() and unsafe_get_user(),
the load is significantly reduced:

    17.46%  test_perf           [.] engine_main
     9.14%  [kernel]            [k] finish_task_switch.isra.0
==>  4.92%  [kernel]            [k] snd_pcm_ioctl
     3.99%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
     3.71%  libc.so.6           [.] __ioctl_time64
     3.61%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     2.72%  libasound.so.2.0.0  [.] sync_ptr1
     2.65%  [kernel]            [k] system_call_exception
     2.46%  [kernel]            [k] sys_ioctl
     2.43%  [kernel]            [k] __rseq_handle_notify_resume
     2.34%  [kernel]            [k] do_epoll_wait
     2.30%  libasound.so.2.0.0  [.] __snd_pcm_mmap_commit
     2.14%  libasound.so.2.0.0  [.] __snd_pcm_avail
     2.04%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
     1.89%  libasound.so.2.0.0  [.] snd_pcm_lock
     1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.76%  libasound.so.2.0.0  [.] __snd_pcm_avail_update
     1.61%  libasound.so.2.0.0  [.] bad_pcm_state
     1.60%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     1.49%  libasound.so.2.0.0  [.] query_status_data

Since v2:
- Fix macros to skip user_read_access_end() when user_read_access_begin() failed
- Fix some tabulations for properly aligning backslashes

Since RFC:
- Added a cover letter to summarize some of the measurements done on and around the RFC
- Fixed relevant checkpatch feedback
- Split last patch in two

Christophe Leroy (4):
  ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
  ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to
    user_access_begin/user_access_end()
  ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in
    struct snd_pcm_mmap_status32
  ALSA: pcm: Convert snd_pcm_sync_ptr() to
    user_access_begin/user_access_end()

 sound/core/pcm_compat.c | 14 +-----
 sound/core/pcm_native.c | 98 ++++++++++++++++++++++++++---------------
 2 files changed, 64 insertions(+), 48 deletions(-)

-- 
2.47.0

