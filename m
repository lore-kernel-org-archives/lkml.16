Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66855220F30
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825755; cv=none; b=kT91JnVlWviAI5JpgEMq1fozykmSuSuJiZw/oLp4MAum6kXuGtbcD2ZtEzyNCB+rfRXuGOGSXiEpk+BrwM8qXYFZIa7FoUOjW4os8hjqAfV2cSsfdl39LpZaNPugxVH028HsKtYrKKADNVdP7bw/S/ReBhcNeWGBtiV9JjDWTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825755; c=relaxed/simple;
	bh=yVK1Ms9KBYaDFXNVXUIeUEopLPcwCBJYkdj5fcwCXok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ta47qvjZHsV6+P1PsrIPICRnmA1wGKGroDKko2PYx0+d6jJSCPPhG3KE3VYpK5a32Pgkz/B17FIiQi7ZXvCutCkIj6zTCouPEZjTbj0XUJkv0l+xlR4CZE/XabwYxxACPp4iuf1/y0XsA2VFMGlTwKcYrfOphXTQQxaEkYwuCtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VCCt840C; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VCCt840C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sidVRaKcAyM8CJMTMIp6V87KPafa4zPoL2RozM8Gtpo=; b=VCCt840Cb526JWT5VN68HlAkYk
	h65Rztk/+WIhrRryiWmh50bExP0YZxo+SoYgPIbpofDLFvkvHFSkFnxOV7suqbabh3zZB7mS3/jSe
	pfDIEuDeG2Cucl9ywX3Dp/PUDa5j/rgMmu+2P/swzDRYFoICALSzY2CYu5imyi/AkPPUwK4JzJ+81
	b+YkQkcIlB1AQEPc6U84PKOfnTWW0SSkXLkXrKVIkAgRvxMaxp1ZSrllLsEQG1Oae4i4Nj/8N7jLa
	Nw322xeLDWDAA5i1OLvc9OmmcccCRGfk9cLxrmHO3VUbmgPnwSWAKXwH4/weQiUZ9d1HdSXbC34/7
	SMcnSB9w==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uDV6D-005wF6-7O; Fri, 09 May 2025 23:22:22 +0200
Message-ID: <f94a179b-be0f-4758-8eea-2a307db87f36@igalia.com>
Date: Fri, 9 May 2025 18:22:18 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-21-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

Thank you for adding a selftest for the new uAPI. The recent futex 
selftests accepted uses the kselftest helpers in a different way than 
the way you have used. I've attached a diff to exemplify how I would 
write this selftest. The advantage is to have a TAP output that can be 
easier used with automated testing, and that would not stop when the 
first test fails.

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> Test the basic functionality of the private hash:
> - Upon start, with no threads there is no private hash.
> - The first thread initializes the private hash.
> - More than four threads will increase the size of the private hash if
>    the system has more than 16 CPUs online.
> - Once the user sets the size of private hash, auto scaling is disabled.
> - The user is only allowed to use numbers to the power of two.
> - The user may request the global or make the hash immutable.
> - Once the global hash has been set or the hash has been made immutable,
>    further changes are not allowed.
> - Futex operations should work the whole time. It must be possible to
>    hold a lock, such a PI initialised mutex, during the resize operation.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

-- >8 --

---
  .../futex/functional/futex_priv_hash.c        | 31 ++++++++++++-------
  1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c 
b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 4d37650baa19..33fa9ad11d69 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -51,15 +51,17 @@ static void futex_hash_slots_set_verify(int slots)

  	ret = futex_hash_slots_set(slots, 0);
  	if (ret != 0) {
-		error("Failed to set slots to %d\n", errno, slots);
-		exit(1);
+		ksft_test_result_fail("Failed to set slots to %d: %s\n", slots, 
strerror(errno));
+		return;
  	}
  	ret = futex_hash_slots_get();
  	if (ret != slots) {
-		error("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns: %d\n",
-		       errno, slots, ret);
-		exit(1);
+		ksft_test_result_fail("Set %d slots but PR_FUTEX_HASH_GET_SLOTS 
returns: %d\n",
+		       		      slots, ret);
+		return;
  	}
+
+	ksft_test_result_pass("futex_hash_slots_set() and get() succeeded (%d 
slots)\n", slots);
  }

  static void futex_hash_slots_set_must_fail(int slots, int immutable)
@@ -67,12 +69,14 @@ static void futex_hash_slots_set_must_fail(int 
slots, int immutable)
  	int ret;

  	ret = futex_hash_slots_set(slots, immutable);
-	if (ret < 0)
+	if (ret < 0) {
+		ksft_test_result_pass("invalid futex_hash_slots_set(%d, %d) 
succeeded.\n",
+				slots, immutable);
  		return;
+	}

-	fail("futex_hash_slots_set(%d, %d) expected to fail but succeeded.\n",
+	ksft_test_result_fail("futex_hash_slots_set(%d, %d) expected to fail 
but succeeded.\n",
  	       slots, immutable);
-	exit(1);
  }

  static void *thread_return_fn(void *arg)
@@ -156,6 +160,8 @@ int main(int argc, char *argv[])
  		}
  	}

+	ksft_print_header();
+	ksft_set_plan(13);

  	ret = pthread_mutexattr_init(&mutex_attr_pi);
  	ret |= pthread_mutexattr_setprotocol(&mutex_attr_pi, 
PTHREAD_PRIO_INHERIT);
@@ -235,13 +241,13 @@ int main(int argc, char *argv[])

  	ret = futex_hash_slots_set(15, 0);
  	if (ret >= 0) {
-		fail("Expected to fail with 15 slots but succeeded: %d.\n", ret);
+		ksft_test_result_fail("Expected to fail with 15 slots but succeeded: 
%d.\n", ret);
  		return 1;
  	}
  	futex_hash_slots_set_verify(2);
  	join_max_threads();
  	if (counter != MAX_THREADS) {
-		fail("Expected thread counter at %d but is %d\n",
+		ksft_test_result_fail("Expected thread counter at %d but is %d\n",
  		       MAX_THREADS, counter);
  		return 1;
  	}
@@ -254,8 +260,7 @@ int main(int argc, char *argv[])

  	ret = futex_hash_slots_get();
  	if (ret != 2) {
-		printf("Expected 2 slots, no auto-resize, got %d\n", ret);
-		return 1;
+		ksft_test_result_fail("Expected 2 slots, no auto-resize, got %d\n", ret);
  	}

  	futex_hash_slots_set_must_fail(1 << 29, 0);
@@ -311,5 +316,7 @@ int main(int argc, char *argv[])
  		fail("Expected immutable private hash, got %d\n", ret);
  		return 1;
  	}
+
+	ksft_print_cnts();
  	return 0;
  }
-- 
2.49.0

